# frozen_string_literal: true

require 'securerandom'

namespace :promotion_code do
  desc 'Generate promotion codes'
  task generate: :environment do
    10.times do
      ApplicationRecord.transaction do
        PromotionCode.create!(code: SecureRandom.alphanumeric(7), discount: Random.rand(100..1000))
      end
      rescue StandardError => e
        Rails.logger.debug e.message
    end
  end
end
