PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>\d[1-9]|[1-9]0|2[AB])\s?(\d{3}\s?){2}(?<key>\d{2})$/
# Get match data
#

require "date"
require 'yaml'
DEPARTMENTS = YAML.load_file('./data/french_departments.yml')

# "a man, born in December, 1984 in Seine-Maritime.""
def french_ssn(ssn)
  return "The number is invalid" if ssn.empty?
  match_data = ssn.match(PATTERN)
  gender = match_data[:gender].to_i == 1 ? "man" : "woman"
  year = "19" + match_data[:year]
  month = Date::MONTHNAMES[match_data[:month].to_i]
  department = DEPARTMENTS[match_data[:department]]

  if valid_key?(ssn, match_data[:key])
    "a #{gender}, born in #{month}, #{year} in #{department}."
  else
    "The number is invalid"
  end
end


def valid_key?(ssn, key)
  #  remainder of the division of (97 - ssn_without_key) by 97.)
  ssn_without_key = ssn.gsub(/\s+/, "")[0...-2]
  remainer = (97 - ssn_without_key.to_i) % 97
  remainer == key.to_i
end

p french_ssn("1 84 12 76 451 089 76")
