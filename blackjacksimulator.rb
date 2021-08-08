ULTIMATE_GOAL       = 21
ODDS_OF_TWO_GOAL    = 2
ODDS_OF_THREE_GOAL  = 3
ODDS_OF_FOUR_GOAL   = 4
ODDS_OF_FIVE_GOAL   = 5
ODDS_OF_SIX_GOAL    = 6
ODDS_OF_SEVEN_GOAL  = 7
ODDS_OF_EIGHT_GOAL  = 8
ODDS_OF_NINE_GOAL   = 9
ODDS_OF_TEN_GOAL    = 10
ODDS_OF_ELEVEN_GOAL = 11
NUM_OF_SIMULATIONS  = 22111
ACE_ALT_VALUE       = 11

POSSIBLE_DRAWS = {
    :ace              => 1,
    :two              => 2,
    :three            => 3,
    :four             => 4,
    :five             => 5,
    :six              => 6,
    :seven            => 7,
    :eight            => 8,
    :nine             => 9,
    :ten              => 10,
    :jack             => 10,
    :queen            => 10,
    :king             => 10,
}.freeze


def draw()
  key = POSSIBLE_DRAWS.keys.sample
  {key: POSSIBLE_DRAWS[key]}
end

my_total = 0
draw_list = []
ace_alt_cond_print = false
iter_num = 0
odds_list = []
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
odds_list << 0
for _ in 0..NUM_OF_SIMULATIONS
    iter_num += 1
    while my_total < ULTIMATE_GOAL
        draw_result = draw
        # decide ace value
        if draw_result[:key] == POSSIBLE_DRAWS[:ace]
            if my_total < ACE_ALT_VALUE
                ace_alt_cond_print = true
                draw_result[:key] = ACE_ALT_VALUE
            end
        end
        my_total += draw_result[:key]
        draw_list << draw_result[:key]
        # exit condition
        if my_total == ULTIMATE_GOAL
            case draw_list.size
            when ODDS_OF_TWO_GOAL
                odds_list[ODDS_OF_TWO_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of two-#{odds_list[ODDS_OF_TWO_GOAL-2]}"
            when ODDS_OF_THREE_GOAL
                odds_list[ODDS_OF_THREE_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of three-#{odds_list[ODDS_OF_THREE_GOAL-2]}"
            when ODDS_OF_FOUR_GOAL
                odds_list[ODDS_OF_FOUR_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of four-#{odds_list[ODDS_OF_FOUR_GOAL-2]}"
            when ODDS_OF_FIVE_GOAL
                odds_list[ODDS_OF_FIVE_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of five-#{odds_list[ODDS_OF_FIVE_GOAL-2]}"
            when ODDS_OF_SIX_GOAL
                odds_list[ODDS_OF_SIX_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of six-#{odds_list[ODDS_OF_SIX_GOAL-2]}"
            when ODDS_OF_SEVEN_GOAL
                odds_list[ODDS_OF_SEVEN_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of seven-#{odds_list[ODDS_OF_SEVEN_GOAL-2]}"
            when ODDS_OF_EIGHT_GOAL
                odds_list[ODDS_OF_EIGHT_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of eight-#{odds_list[ODDS_OF_EIGHT_GOAL-2]}"
            when ODDS_OF_NINE_GOAL
                odds_list[ODDS_OF_NINE_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of nine-#{odds_list[ODDS_OF_NINE_GOAL-2]}"
            when ODDS_OF_TEN_GOAL
                odds_list[ODDS_OF_TEN_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of ten-#{odds_list[ODDS_OF_TEN_GOAL-2]}"
            when ODDS_OF_ELEVEN_GOAL
                odds_list[ODDS_OF_ELEVEN_GOAL-2] += 1
                p "SIM_NUM-#{iter_num}: Number of odds of eleven-#{odds_list[ODDS_OF_ELEVEN_GOAL-2]}"
            else
                # Do nothing
            end
            draw_list.clear
            my_total = 0
            break
        end
        if my_total > ULTIMATE_GOAL
            draw_list.clear
            my_total = 0
            break
        end
    end
end