
/// Note: This is not a species, this is an antagonist. This antag is not limited to humans.
/// Frankly, there aren't enough of them on Complexe to not make who the vamp is not potentially immediately obvious.

#define VAMP_DRAIN_AMOUNT 50


/datum/antagonist/vampire
  name = "Vampire"
  roundend_category = "vampires"
  antagpanel_category = "Vampire"
  job_rank = ROLE_VAMPIRE
  antag_moodlet = /datum/mood_event/focused
  antag_hud_name = "vampire"
  hijack_speed = 1.5
  ui_name = "AntagInfoVampire"
  suicide_cry = "BEHOLD!!"
  antag_memory = "You are a <span class='danger'>Vampire</span>. You will slowly but constantly lose blood if outside of a coffin. If inside a coffin, you will slowly heal. You may gain more blood by grabbing a live victim and using your drain ability."
  ///var/vampire_heart_organ_slot = ORGAN_SLOT_HEART /// might not be necessary
  var/vampire_tongue_organ_slot = ORGAN_SLOT_TONGUE

  var/you_are_greet = TRUE
  var/give_objectives = TRUE




/datum/antagonist/vampire/on_gain()
  owner.special_role = job_rank

  if (give_objectives)
    forge_objectives()


  /// Give vampire traits to the vampire
  /// ADD_TRAIT()
  ///TRAIT_NOHUNGER,
  ///TRAIT_NOBREATH,
  ///DRINKSBLOOD
  /// owner.current ?
  ADD_TRAIT(owner.current, TRAIT_NOHUNGER, INNATE_TRAIT)
  ADD_TRAIT(owner.current, TRAIT_NOBREATH, INNATE_TRAIT)
  ADD_TRAIT(owner.current, DRINKSBLOOD, INNATE_TRAIT)
  /// donner nightvision au vampire

  /// Give mutant heart and mutant tongue to linked body

  /// Give to the vampire the ability to drain blood

  /// Give to the vampire the ability to convert a crewmember into a thrall

  /// Give the vampire objectives

  /// find datum/objective to give objectives?

  owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/tatoralert.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

  return ..()

/datum/antagonist/vampire/on_removal()
	if(!silent && owner.current)
		to_chat(owner.current,span_userdanger("You are no longer the [job_rank]!"))

	owner.special_role = null

	return ..()

/datum/antagonist/vampire/apply_innate_effects(mob/living/mob_override)
  var/placeholder2 = 1
  return

/datum/antagonist/vampire/proc/forge_objectives()
  var/placeholder1 = 1
  return

#undef VAMP_DRAIN_AMOUNT
