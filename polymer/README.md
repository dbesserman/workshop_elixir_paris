# Polymer

The polymer is formed by smaller units which, when triggered, react with each other such
that two adjacent units of the same type and opposite polarity are destroyed. Units' types are
represented by letters; units' polarity is represented by capitalization.
For instance, r and R are units with the same type but opposite polarity,
whereas r and s are entirely different types and do not react.

run `$ mix test`. It should fail. Your goal is to make the tests pass.

## Step 1: Perform reactions on a polymer

You are given a string representing the original polymer. Your goal is to write a function that takes
that string and returns a string representing the polymer once the reaction has occured.

For example:

- In "aA", a and A react, leaving nothing behind.
- In "abBA", bB destroys itself, leaving aA. As above, this then destroys itself, leaving nothing.
- In "abAB", no two adjacent units are of the same type, and so nothing happens.
- In "aabAAB", even though aa and AA are of the same type, their polarities match, and so nothing happens.

## Step 2: Optimize reaction

Sometimes one of the unit types is causing problems. it's preventing the polymer from collapsing
as much as it should. Your goal is to figure out which unit type is causing the most problems,
remove all instances of it (regardless of polarity), fully react the remaining polymer, and measure its length.

For example:

For example, again using the polymer dabAcCaCBAcCcaDA from above:

- Removing all A/a units produces dbcCCBcCcD. Fully reacting this polymer produces dbCBcD, which has length 6.
- Removing all B/b units produces daAcCaCAcCcaDA. Fully reacting this polymer produces daCAcaDA, which has length 8.
- Removing all C/c units produces dabAaBAaDA. Fully reacting this polymer produces daDA, which has length 4.
- Removing all D/d units produces abAcCaCBAcCcaA. Fully reacting this polymer produces abCBAc, which has length 6.

In this example, removing all C/c units was best, producing the answer 4.

Your goal here is to perform the reaction after removing the the unit that prevents the polymer from reaching
it's optimal form.

## Watch mode

To run the tests in watch mode, install deps with `mix deps.get`, then run `mix test.watch`. Tests will refresh automatically when files have been changed.
