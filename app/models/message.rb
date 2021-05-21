class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  <div class="message">
  <div class="upper-message">
    <div class="message-user">
      <!-- 投稿したユーザー名情報を出力する -->
      <%= message.user.name %>
    </div>
    <div class="message-date">
      <!-- 投稿した時刻を出力する -->
      <%= l message.created_at %>
    </div>
  </div>
  <div class="lower-message">
    <div class="message-content">
      <!-- 投稿したメッセージ内容を記述する -->
      <%= message.content %>
    </div>
    <%= image_tag message.image, class: 'message-image' if message.image.attached? %>
  </div>
</div>
end