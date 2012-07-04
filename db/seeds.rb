# encoding: utf-8
require 'FileUtils'

[User, Property, Category].each do |model|
  model.destroy_all
end

FileUtils.rm_rf 'ckeditor_assets'
FileUtils.rm_rf 'system'

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
  instance
end

FactoryGirl.create :user
create_translated :property, :code => 'contacts', :view => "text", :value => [
"<p>Tel: <strong>+34(00) 157-238-920</strong></p>
<p>Address: Art Str., 18A</p>
<p>email: admin@art-life.com</p>",
"<p>	电话: <strong>+34(00) 157-238-920</strong></p>
<p>	地址：艺术STR，18A</p>
<p>	电子邮件: admin@art-life.com</p>"]
create_translated :property, :code => 'skype_name', :view => "string", :value => ['art_life_skype', 'art_life_skype_cn' ]
create_translated :property, :code => 'icq_name', :view => "string", :value => ['art_life_icq', 'art_life_icq_cn']
en_text = "<p>
	Lorem ipsum dolor sit amet, te per fugit simul consul, ei est debet persequeris. Pri ea simul quaestio, et eos elit inermis. Fugit corpora te nec, erat decore corrumpit nam ea. Delectus ocurreret forensibus ius ei, est eu ullum quodsi timeam.<br />
	<br />
	Ne duo quando nonumy timeam, insolens tincidunt temporibus at est, est illum dolore te. Decore animal nam te. Augue omittam imperdiet nec ei. Eam an quaeque impedit iracundia.<br />
	<br />
	Sea in quas velit, nam at delicata honestatis. Cu cum debet fierent, has cetero consulatu democritum ex. Aperiam fierent ex vim. Eos ut iusto putent, te euismod volumus omittantur mei. Quot quaestio voluptatum ius cu, no pri tale pertinax facilisis, saperet disputando in sea.<br />
	<br />
	No ullum omnes expetenda mel, eam velit habemus ut. Pro ea odio delicatissimi necessitatibus, vide periculis quaerendum his at, docendi voluptatibus mel eu. Utinam tacimates maluisset est cu, qui alia labores instructior at, pro no wisi euismod sapientem. Ne dicta nostrud imperdiet pri. Tritani appellantur nam an, an pro debet vivendum. An meis labores mei, in blandit voluptaria sed.<br />
	<br />
	Has cibo viderer oporteat id, an qui alia disputando. Ei nam euismod honestatis, nam oratio exerci neglegentur ne, cu commodo pertinacia mei. Ea nulla vidisse est, consul reformidans no pri, vix quodsi inermis epicuri in. Et pro esse regione facilisis, apeirian signiferumque vis ad.</p>
"
cn_text = "<p>
	組界著者利地村趣覇著申越装野。見三毎法能紙無内約価者富。写社携以都政作士護同要表護歌別木禁。込下良我禁新酒流新断情一年。子供郭当界面料交暫第字月他。約直冠生何推弥対資賞満断注芸目紹河心一合。内町奇大会達盛上婦暮備司信府離本。直状就聞写相車僚歳選改堤。文共示実扱報検影索性増傘低。訴拉八配治調長王祉元竹禁感索。<br />
	<br />
	戸探多当理画角予民程読団左線。詳者覧田聞探指音介戦譲奉健動教。山測駒囲有験聞他族部行抗断期放。稿応畑人観土情虚思開宮糸思。積八円需栄安来山安用軽今層壊株。選争事回南権油供館義気蔵性境。著久付清博清泉開四藤無健分癒。本学落予号着科取頼和職川方争車。者育投帰援時載直予前込幸。無必露本松情大筆岩社無秀潟三連売恋。<br />
	<br />
	著鷺事調龍持忠体事政改岩浴天統。当応能禁博察野寝務児以乗長方横。幌治最触禁右要提兆策保院。行賞内要暮転種北賄条観期何話制選郭作月目。点医続況上情陽育後済宮取停種蔵込社成玉。労面響質提進埼権蒼残祥新制購制証馬客本鏝。馬更辺変先展経唐載導水合院活逆今了櫛金渡。蔵税航小家新開槻本職裕実。刻明記米生習急達規道神一予呼界道。<br />
	<br />
	上役基敬回政害毎大心直用要。隊書数根秋保教者理規尾臣流再宅囲景府。谷板止語統獲地林樫気南使。列景秋表文持国暮負献呼朝情彦畿株境。社捕史払打呼身推者製分応根方内子。待育置類別上銀福閣議参解通際稿月司南聴聞。歯合高再選洲線銅電通治援念造。真職山向国減鳥個央転明件託転著健。挑責稿図亡連聴清参竹面心汚驚車資。<br />
	<br />
	雪質済突更眞会下供談体無臓朝基取壊。去意譲王合開闘現惑草譲曲都。京国選屋録富舞禁代官受例平探悩。渡純料問声価野政人社世正。談国要交全略行一縮月千待棚影替送件合。東外民後開企束立罪真男地属機断。樹門彦束禁報外作変良途買不載。日島量筑寒出町揚録編選論臣込。合都録毎帽成奈約番手会尼能苦韓横防食婚。経区表質共鳥必巻掲辞有郊割。</p>
"

create_translated :property, :code => 'about_us_page', :view => "text", :value => [en_text, cn_text]


[["Projects", "项目"], ["Singers", "歌手"], ["Life-band", "生活带"], ["Dance", "跳舞"], ["Models", "模型"]].each do |names|
  create_translated :category, :name => names
end
first_category = Category.first

first_artist = create_translated :artist, :category => first_category, :title => ["Anna Akhmatova", "安娜·阿赫玛托娃"], :biography => [en_text, cn_text],
:country => ["Russia", "俄国"]

create_translated :artist, :category => first_category, :title => ["Anna Akhmatova", "安娜·阿赫玛托娃"], :biography => [en_text, cn_text],
:country => ["Russia", "俄国"]

third_artist = create_translated :artist, :category => first_category, :title => ["Dmitro Pavlenko", "安娜·阿赫玛托娃"], :biography => [en_text, cn_text],
:country => ["Ukraine", "俄国"]

create_translated :artist, :category => first_category, :title => ["Maxim Pavlenko", "安娜·阿赫玛托娃"], :biography => [en_text, cn_text],
:country => ["Moldova", "俄国"]

8.times{create_translated :artist, :category => first_category, :title => ["Maxim Pavlenko", "安娜·阿赫玛托娃"], :biography => [en_text, cn_text],
:country => ["Moldova", "俄国"]}

Photo.create :data => File.new(File.join(Rails.root, 'spec', 'fixtures', 'img1.jpeg')), :artist => first_artist
Photo.create :data => File.new(File.join(Rails.root, 'spec', 'fixtures', 'img2.jpeg')), :artist => first_artist
Photo.create :data => File.new(File.join(Rails.root, 'spec', 'fixtures', 'img3.jpeg')), :artist => first_artist

10.times{Photo.create :data => File.new(File.join(Rails.root, 'spec', 'fixtures', 'img2.jpeg')), :artist => third_artist}

9.times{create_translated :media_url, :artist => first_artist, :title => ["My mega song(rmix)", " 雪質済突更眞会下供"], 
:player_url => "http://www.tudou.com/v/cSjdNCVVEaQ/&resourceId=0_04_05_99/v.swf", :kind => :audio}
5.times{create_translated :media_url, :artist => first_artist, :title => ["My mega clip(rmix)", " 雪質済突更眞会下供"], 
:player_url => "http://player.youku.com/player.php/sid/XNDIzMTM1MDM2/v.swf", :kind => :video}

5.times{create_translated :news_event, :content => [en_text, cn_text]}
