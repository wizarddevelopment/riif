require 'spec_helper'

describe Riif::IIF do

  context 'mixed document' do
    let(:expected) { File.read('spec/fixtures/mixed.iif') }

    let(:mixed) {
      Riif::IIF.new do |o_riif|
        o_riif.cust do |o_cust|
          o_cust.row do |o_row|
            o_row.name 'Batman'
            o_row.baddr1 'Amoy'
          end
        end

        o_riif.bud do |o_bud|
          o_bud.row do |o_row|
            o_row.ccnt 'Accounts Receivable'
            o_row.period 'MONTH'
            o_row.amount 'foo'
            o_row.startdate '3/14/12'
          end
          o_bud.row do |o_row|
            o_row.accnt 'Accounts Payable'
            o_row.period 'MONTH'
            o_row.amount '123'
            o_row.startdate '3/15/12'
          end
        end

        o_riif.trns do |o_trns|
          o_trns.row do |o_row|
            o_row.trnsid 'foo'
          end
          o_trns.spl do |o_spl|
            o_spl.row do |o_row|
              o_row.splid 'joker'
            end
          end
          o_trns.spl do |o_spl|
            o_spl.row do |o_row|
              o_row.splid 'foobar'
            end
          end
        end

        o_riif.cust do |o_cust|
          o_cust.row do |o_row|
            o_row.name 'Joker'
            o_row.baddr1 'Amoy'
          end
        end
      end
    }
    subject { mixed }

    its(:output) { should eq expected }
  end
end
