require "ndhash/version"

module NDHash
  module_function

  def generate(level:, entries_per_level:2, pointers_per_level:1)
    generate_rec(1, level, entries_per_level, pointers_per_level)
  end

  def generate_rec(current_level, max_level, entries_per_level, pointers_per_level)
    hash = {}

    entries_per_level.times do |n|
      add_entry(hash, current_level, entry_num: n+1)
    end

    unless current_level == max_level
      pointers_per_level.times do |n|
        next_level = generate_rec(current_level+1, max_level, entries_per_level, pointers_per_level)
        hash[get_pointer_key(current_level, entry_num: n+1)] = next_level
      end
    end

    hash
  end

  def add_entry(hash, level, entry_num:)
    hash[get_entry_key(level, entry_num)] = get_value(level, entry_num)
  end

  def get_entry_key(level, entry_num)
    "level_#{level}_key_#{entry_num}"
  end

  def get_value(level, entry_num)
    "level_#{level}_value_#{entry_num}"
  end

  def get_pointer_key(level, entry_num:)
    "level_#{level}_pointer_#{entry_num}"
  end
end
