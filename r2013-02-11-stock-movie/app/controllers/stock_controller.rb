class StockController < ApplicationController
  def newstock
  end

  def submitstock
    if params[:symbol].present?
      @symbol = params[:symbol].upcase
      @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
      render 'result'
    end
  end

  def result
  end

end