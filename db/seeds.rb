# encoding: utf-8

User.destroy_all
Property.destroy_all
Category.destroy_all

def create_translated class_name, options = {}
  clazz = class_name.to_s.classify.constantize
  instance = clazz.new options
  clazz.translated_attribute_names.each do |attr|
    I18n.locale = :cn
    instance.send "#{attr}=", options[attr][1]
    I18n.locale = :en
    instance.send "#{attr}=", options[attr][0]
  end
  instance.save
end
some_cn_text = "它是在2012年1月举行的最后的北部白犀牛委员会会议决定将逊尼派和罗津到大的博马和迁入小博马苏丹和Fatu的。

北部白犀牛委员会，致力于从濒临灭绝的物种的专业人员队伍，认为此举将增加养殖犀牛的机会自然。然而，在移动之前，逊尼派和罗津得到了两个新的同伴 - 女性南部白犀牛。这是为了帮助罗津形成与南部的白犀牛的债券，以便当他们搬进大博马，她并不隐藏在灌木丛中，由她自己。

tauwa，六岁的南白，是二月23日提出的第一个。她冲过来，成箱的领导和移动使用我们的车易位，艾拉，小博马。她先是保存在观察相邻控股博马的镇定剂的作用而脱落。后来，她被释放参加罗津，而逊尼派被保存在一个单独的博马两天。这是为了确保，苏尼没有试图接近她，而在她的系统仍然是麻醉。虽然该计划是与罗津Tauwa债券几天后，她似乎急于实现我们的团队。他们决定在第二个南部白人女性从大博马移动。"

some_en_text = "Tenetur sed consequatur sequi. Accusamus consectetur aspernatur. Ut architecto alias. Ipsam sequi voluptatem odit. - Laborum impedit soluta. Consequuntur ut ea. Natus rerum veritatis. - Ad odit iusto ea. Occaecati dolor nihil dignissimos id. Reprehenderit enim nostrum totam est sed. "

FactoryGirl.create :user
create_translated :property, :code => 'contacts', :view => "text", :value => ['Tel: 123-123-123', 'TEL: 123-123-123']
create_translated :property, :code => 'skype_name', :view => "string", :value => ['art_life_skype', 'art_life_skype_cn' ]
create_translated :property, :code => 'icq_name', :view => "string", :value => ['art_life_icq', 'art_life_icq_cn']
create_translated :property, :code => 'about_us_page', :view => "text", :value => [some_en_text, some_cn_text]

["Projects", "Singers", "Life-band", "Dance"].each do |name|
  create_translated :category, :name => [name, "#{name}_cn"]
end


