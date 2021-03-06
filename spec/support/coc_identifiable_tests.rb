shared_examples "coc identifiable" do |instance|
   
  describe "coc_id" do
    it "should be present" do
      instance.coc_id = nil
      expect(instance).to be_invalid
    end

    it "should be unique per Class type" do
      persisted_instance = instance.dup
      persisted_instance.save

      instance2 = FactoryGirl.build(instance.class.name.downcase.to_sym, coc_id: persisted_instance.coc_id)
      expect(instance2).to be_invalid

      instance2.coc_id = "#FOOBAR42" # bah! I hate it when get rid of the war results history.  I suppose that's kind of obvious given this site...
      expect(instance2).to be_valid

      persisted_instance.delete
    end

    it "should be seven, eight, nine, or ten characters long, begin with a '#', and continue with alpha/numeric" do
      # in character range but doesn't start with '#'
      instance.coc_id = "PQVUJ2PR" # shout out to Count Dubula
      expect(instance).to be_invalid

      # starts with '#' but total is over the max characters
      instance.coc_id =  "#ABCDEFGHIJ"
      expect(instance).to be_invalid

      # starts with '#' but total is under the min characters
      instance.coc_id = "#ABCDE"
      expect(instance).to be_invalid

      # in character range but has special characters
      instance.coc_id = "#A}CDEFG"
      expect(instance).to be_invalid

      # seven characters of proper formatting
      instance.coc_id = "#9GGLJJ" # shout out to the first time I saw this few (xXMoMo71Xx of The trooper)

      # eight characters of proper formatting
      instance.coc_id = "#8JR8G8L"
      expect(instance).to be_valid

      # nine characters of proper formatting
      instance.coc_id = "#8JR8G8L9" # shout out to New World 9
      expect(instance).to be_valid

      # ten characters of proper formatting
      instance.coc_id = "#2280C2UQV" # shout out to the first time I saw this many (VitLoveLin of pinklove)
      expect(instance).to be_valid
    end

    it "should be persisted in upper case" do
      persisted_instance = instance.dup
      persisted_instance.coc_id = "#rcq0j0jr"

      expect(persisted_instance).to be_valid
      persisted_instance.save
      expect(persisted_instance.coc_id).to eq("#RCQ0J0JR") # it's me snitches

      persisted_instance.delete
    end

    it "should be persisted with \"0\" (zero) not \"O\" (o)" do
      persisted_instance = instance.dup
      persisted_instance.coc_id = "#rcqojOjr"

      expect(persisted_instance).to be_valid
      persisted_instance.save
      expect(persisted_instance.coc_id).to eq("#RCQ0J0JR")

      persisted_instance.delete
    end
  end

end
