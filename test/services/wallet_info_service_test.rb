require "test_helper"

class WalletInfoServiceTest
  class CorrectWalletAddressTestCases < ActiveSupport::TestCase
    def setup
      @service = WalletInfoService.new("16KYFJiAoM4aX82xw2V3YBHX72trWNhz48")
    end

    test "#info?" do
      assert @service.info
      assert_nil @service.error
    end
  end

  class BlankWalletAddressTestCases < ActiveSupport::TestCase
    def setup
      @service = WalletInfoService.new("")
    end

    test "#info" do
      refute @service.info
      assert_not_nil @service.error
    end
  end
end
