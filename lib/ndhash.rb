require "ndhash/version"

module NDHash
  module_function

  def generate(levels:, values_per_level:2, hashes_per_level:1)
    raise ArgumentError, 'Negative or zero value given' if levels < 1 or values_per_level < 0 or hashes_per_level < 0
    raise ArgumentError, 'Less than 1 number of pointers defined for multi-level hash' if levels > 1 and hashes_per_level < 1
    generate_rec(1, levels, values_per_level, hashes_per_level)
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

  def count_levels(hash)
    count_levels_rec(1, hash)
  end

  def count_levels_rec(current_level, hash)
    max_level = current_level
    hash.each_value do |v|
      if Hash === v
        max_level = [count_levels_rec(current_level+1, v), current_level].max
      end
    end
    max_level
  end
end
