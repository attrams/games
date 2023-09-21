defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """
  def main(_args) do
    output_message()
  end

  defp output_message() do
    output = """
    What game would you like to play?

    1. Guessing Game.
    2. Rock Paper Scissors.
    3. Wordle.

    enter "stop" to exit
    enter "score" to view your current score
    """

    input = IO.gets(output) |> String.trim() |> String.downcase()

    case input do
      "score" ->
        current_score()
        output_message()

      "1" ->
        guessing_game()
        output_message()

      "2" ->
        rock_paper_scissors()
        output_message()

      "3" ->
        wordle()
        output_message()

      "stop" ->
        nil

      _ ->
        incorrect_input()
        output_message()
    end
  end

  defp current_score() do
    score = """

    ==================================================
    Your score is #{Games.ScoreTracker.current_score()}
    ==================================================
    """

    IO.puts(score)
  end

  defp guessing_game() do
    Games.ScoreTracker.add_points(5)
  end

  defp rock_paper_scissors() do
    Games.ScoreTracker.add_points(10)
  end

  defp wordle() do
    Games.ScoreTracker.add_points(25)
  end

  defp incorrect_input() do
    IO.puts("Incorrect input")
  end
end
