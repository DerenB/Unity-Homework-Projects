using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class MovementController : MonoBehaviour
{
    // Reference variables for movement class
    PlayerInput playerInput;
    CharacterController characterController;

    // Variables to store player input values
    Vector2 currentMovementInput;
    Vector3 currentMovement;
    Vector3 currentRunMovement;
    bool isMovementPressed;
    bool isRunPressed;
    float rotationFactorPerFrame = 15.0f;
    float runMultiplier = 15.0f;

    // Runs early, before start function
    private void Awake()
    {
        // Initializes the reference variables
        playerInput = new PlayerInput();
        characterController = GetComponent<CharacterController>();

        // Callback for starting movement
        playerInput.CharacterControls.Move.started += OnMovementInput;

        // Stops the character
        playerInput.CharacterControls.Move.canceled += OnMovementInput;

        // Slows the character (for controller input)
        playerInput.CharacterControls.Move.performed += OnMovementInput;

        // For Sprinting
        playerInput.CharacterControls.Run.started += OnRun;
        playerInput.CharacterControls.Run.canceled += OnRun;
    }

    void OnRun  (InputAction.CallbackContext context)
    {
        isRunPressed = context.ReadValueAsButton();
    }

    void HandleRotation()
    {
        Vector3 positionToLookAt;

        // The change in position the character should point to
        positionToLookAt.x = currentMovement.x;
        positionToLookAt.y = 0.0f;
        positionToLookAt.z = currentMovement.z;

        // Current Rotation
        Quaternion currentRotation = transform.rotation;

        if (isMovementPressed)
        {
            // Creates a new rotation based on input
            Quaternion targetRotation = Quaternion.LookRotation(positionToLookAt);

            // Slerp = spherical rotation
            transform.rotation = Quaternion.Slerp(currentRotation, targetRotation, Time.deltaTime);
        }
    }

    // Function to manage movement
    void OnMovementInput (InputAction.CallbackContext context)
    {
        // Reads the context, assigns to movement
        currentMovementInput = context.ReadValue<Vector2>();
        currentMovement.x = currentMovementInput.x;
        currentMovement.z = currentMovementInput.y;
        currentRunMovement.x = currentMovementInput.x * runMultiplier;
        currentRunMovement.z = currentMovementInput.y * runMultiplier;

        // Checks for movement pressed
        isMovementPressed = currentMovementInput.x != 0 || currentMovementInput.y != 0;
    }

    void HandleGravity()
    {
        if (characterController.isGrounded)
        {
            float groundedGravity = -0.05f;
            currentMovement.y = groundedGravity;
            currentRunMovement.y = groundedGravity;
        }
        else
        {
            float gravity = -9.8f;
            currentMovement.y += gravity;
            currentRunMovement.y += gravity;
        }
    }

    // Update is called once per frame
    void Update()
    {
        // Checks Gravity
        HandleGravity();

        // Character Rotation 
        HandleRotation();

        // Moves the character
        // Only call Move once within Update
        if (isRunPressed)
        {
            characterController.Move(currentRunMovement * Time.deltaTime);
        } 
        else
        {
            characterController.Move(currentMovement * Time.deltaTime * 5.0f);
        }

        
        
    }

    // Enables Character input
    private void OnEnable()
    {
        playerInput.CharacterControls.Enable();
    }

    // Disables Character input
    private void OnDisable()
    {
        playerInput.CharacterControls.Disable();
    }
}

/*
 * SOURCE LOCATIONS
 * https://youtu.be/UUJMGQTT5ts
 * https://youtu.be/bXNFxQpp2qk
 * 
 * Model ?
 * https://assetstore.unity.com/packages/3d/characters/jammo-character-mix-and-jam-158456
 */
