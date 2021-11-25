
/// Note: This is not a species, this is an antagonist. This antag is not limited to humans.
/// Frankly, there aren't enough of them on Complexe to not make who the vamp is not potentially immediately obvious.

#define VAMP_DRAIN_AMOUNT 50


/datum/antagonist/vampire
  name = "Vampire"
  roundend_vategory = "vampires"
  antagpanel_category = "Vampire"
  job_rank = ROLE_VAMPIRE
	antag_moodlet = /datum/mood_event/focused
	antag_hud_name = "vampire"
	hijack_speed = 0.5
	/// ui_name = "AntagInfoVampire"
	suicide_cry = "BEHOLD!!"
  antag_memory = "You are a <span class='danger'>Vampire</span>. You will slowly but constantly lose blood if outside of a coffin. If inside a coffin, you will slowly heal. You may gain more blood by grabbing a live victim and using your drain ability."
  var/you_are_greet = TRUE
  var/give_objectives = TRUE
  var/give_uplink = FALSE


/datum/antagonist/vampire/on_gain()
  owner.special_role = job_rank

  if (give_objectives)
    forge_objectives()

    /// will this throw an exception? who knows
	if(give_uplink)
		owner.give_uplink(silent = TRUE, antag_datum = src)
	uplink = owner.find_syndicate_uplink()

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
