﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RigidBodySleep : MonoBehaviour 
{

	// Use this for initialization
	void Start () 
	{
		Rigidbody rb = GetComponent<Rigidbody>();
		if (rb != null) rb.Sleep();
	}
	
	// Update is called once per frame
	void Update () 
	{

	}
}
