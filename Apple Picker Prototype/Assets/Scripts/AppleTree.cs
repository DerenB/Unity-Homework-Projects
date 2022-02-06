using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AppleTree : MonoBehaviour
{
    [Header("Set in Inspector")]

    // Prefab for instantiating apples
    public GameObject applePrefab;

    // Speed at which the AppleTree moves
    public float speed = 1f;

    // Distance where AppleTree turns around
    public float leftAndRightEdge = 10f;

    // Chance that the AppleTree will change directions
    public float chanceToChangeDirections = 0.1f;

    // Rate at which Apples will be instantiated
    public float secondsBetweenAppleDrops = 1f;

    // Use this for initialization
    void Start()
    {
        // Dropping apples every second
        Invoke("DropApple", 2f);
    }

    void DropApple()
    {                                                               // b
        GameObject apple = Instantiate<GameObject>(applePrefab);    // c
        apple.transform.position = transform.position;              // d
        Invoke("DropApple", secondsBetweenAppleDrops);              // e
    }

    // Update is called once per frame
    void Update()
    {
        // Basic Movement
        Vector3 pos = transform.position;
        pos.x += speed * Time.deltaTime;
        transform.position = pos;

        // Changing Direction
        if (pos.x < -leftAndRightEdge)
        {                                               // a
            speed = Mathf.Abs(speed); // Move right     // b
        }
        else if (pos.x > leftAndRightEdge)              // c
        {
            speed = -Mathf.Abs(speed); // Move left     // c
        }

        /* Changing Direction Notes:
         * a) Tests where the new pos.x is less than the negative
         * side-to-side limit set by leftAndRightEdge
         * 
         * b) if pos.x is too small, makes the value positive (right movement)
         * 
         * c) if pos.x is greater, makes the value negative (left movement)
         * 
         * d) Returns a random float value between 0 and 1. Will change directions
         * if it is less than chanceToChangeDirections
         * 
         * e) Flips the sign of speed (direction)
         */
    }

    void FixedUpdate()
    {
        // Changing Direction Randomly is now time-based because of FixedUpdate()
        if (Random.value < chanceToChangeDirections)
        {                     // b
            speed *= -1; // Change direction
        }
    }
}
