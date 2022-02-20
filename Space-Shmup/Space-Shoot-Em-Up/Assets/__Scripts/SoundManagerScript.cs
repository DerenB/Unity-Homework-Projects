using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManagerScript : MonoBehaviour {

	public static AudioClip explosion, lazerShot, shields, blow;
	static AudioSource audioSrc;

	// Use this for initialization
	void Start () {

		explosion = Resources.Load<AudioClip>("Explosion");
		lazerShot = Resources.Load<AudioClip>("Lazer");
		shields = Resources.Load<AudioClip>("ShieldsDown");
		blow = Resources.Load<AudioClip>("blow");

		audioSrc = GetComponent<AudioSource>();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public static void PlaySound(string clip)
    {
		switch (clip)
        {
			case "explode":
				audioSrc.PlayOneShot(explosion);
				break;
			case "lazer":
				audioSrc.PlayOneShot(lazerShot);
				break;
			case "shields":
				audioSrc.PlayOneShot(shields);
				break;
			case "blow":
				audioSrc.PlayOneShot(blow);
				break;
        }
    }
}


/*
 * YouTube Tutorial Source: https://youtu.be/8pFlnyfRfRc
 * Audio Files Source: https://opengameart.org/content/deep-system-computer-voice
 * Used to Convert File Types: https://cloudconvert.com/flac-to-wav
 * 
 */
