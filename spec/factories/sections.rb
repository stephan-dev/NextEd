# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id              :bigint(8)        not null, primary key
#  year_start      :integer          not null
#  level           :integer          not null
#  sub_section     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  year_end        :integer
#  scholar_year_id :bigint(8)
#

FactoryBot.define do
  factory :section do
    year_start { 2018 }
    year_end { 2019 }
    level { 6 }
    sub_section { "E" }
    scholar_year
  end
end
