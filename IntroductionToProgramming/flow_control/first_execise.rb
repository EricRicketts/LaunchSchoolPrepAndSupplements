# 1. (32 * 4) >= 129: false because 128 is not >= 129
# 2. false != !true: false because !true = false so we have false != false which is false
# 3. true == 4: false because true and 4 are different objects though both are true in a conditional
# 4. false == (847 == '847'): true because 847 == '847' is false, so false == false
# 5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false: true because only one has to be true and (328 / 4) == 82 is true