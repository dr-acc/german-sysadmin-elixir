defmodule Username do
  @moduledoc """
  A module for functions that sanitize an email address from German.
  """

  @doc """
  A function for sanitizing emails by transforming characters in German to English equivalents.
  """
  def sanitize '' do
    ''
  end

  @spec sanitize( charlist() ) :: charlist()
  def sanitize([ char | tail ]) do
    sanitized =
      case char do
      # ä becomes ae
      ?ä -> 'ae'
      # ö becomes oe
      ?ö -> 'oe'
      # ü becomes ue
      ?ü -> 'ue'
      # ß becomes ss
      ?ß -> 'ss'
      x when x >= ?a and x <= ?z -> [x]
      #underscores remain
      ?_ -> '_'
      _ -> ''
    end
    #recursive call concats sanitized with tail
    sanitized ++ sanitize(tail)
  end
end
