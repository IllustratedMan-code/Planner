
class transition:
    def __init__(self, symbol, replace, direction, state):
        self.symbol = symbol
        self.replace = replace
        self.direction = direction
        self.state = state


class state:
    def __init__(self, transitions, final=False):
        self.transitions = transitions
        self.final = final

class turing_machine:
    def __init__(self, states: dict,input_tape :str, start_state="S"):
        self.states = states
        self.input_tape = list(input_tape)
        self.pointer = 0
        self.current_state = states[start_state]
        self.current_state_name = start_state
        self.max_transitions = 100 * len(input_tape)
        self.transition_count = 0

    def transition(self):
        transitioned = False
        for t in self.current_state.transitions:
            if self.input_tape[self.pointer] == t.symbol:
                transitioned = True
                self.transition_count += 1
                self.input_tape[self.pointer] = t.replace
                if t.direction == "left":
                    self.pointer -= 1
                elif t.direction == "right":
                    self.pointer += 1

                if self.pointer == -1:
                    self.input_tape = [" "] + self.input_tape
                    self.pointer = 0
                elif self.pointer == len(self.input_tape):
                    self.input_tape = self.input_tape + [" "]
                self.current_state = states[t.state]
                self.current_state_name = t.state
                self.print_info()
                break
        return not transitioned
    def print_info(self):
        UP = "\x1B[4A"
        print(f"Transition count:{self.transition_count}")
        print(f"Current state:{self.current_state_name}")
        print(f"Current pointer:{self.pointer}")
        print(f"current tape:")
        print("".join(self.input_tape[:self.pointer]) + "[" + self.input_tape[self.pointer] + "]" + "".join(self.input_tape[self.pointer+1:]))

    def transition_until_stop(self):
        while(True):
            t = self.transition()
            if t and self.current_state.final:
                print("The string was accepted by the machine and resulted in the following output:")
                output = "'" + "".join(self.input_tape[self.pointer:]).rstrip() +"'"
                return output
            elif t:
                print("The string was not accepted by the machine (state was not final) and resulted in the following output:")
                output = "'" + "".join(self.input_tape[self.pointer:]).rstrip() +"'"
                return output
                break
            elif self.transition_count >= self.max_transitions and self.max_transitions != -1:
                print("Maximum transition count was met, the implies the existance of an infinite loop")
                print("To set an infinite maximum transition count, set turing_machine.max_transitions to -1")
                break

if __name__ == "__main__":
    # define states like so
    states = {
        "S": state(
            transitions = [transition("1", "X", "right", "S" ),
                           transition(" ", " ", "left", "S"),
                           transition("X", "X", "left", "F" )]),
        "F": state(
            transitions = [],
            final = True)
        }
    # create turing machine
    T = turing_machine(states, "111")
    # test the turing machine (will output string starting at pointer)
    T.transition_until_stop()
    # you can also use transition() for step by step
