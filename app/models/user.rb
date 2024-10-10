class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :request_logger, dependent: :destroy

  enum role: { user: 0, admin: 1 }

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: [:facebook, :google_oauth2, :github]

  before_save :set_gravatar_hash, if: :email_changed?

  def name_or_email
    if name.present?
      name
    else
      email.split('@')[0]
    end
  end

  private

  def set_gravatar_hash
    return if email.blank?
    self.gravatar_hash = Digest::SHA256.hexdigest(email.strip.downcase)
  end
end
