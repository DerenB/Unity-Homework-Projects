using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    private CharacterController _controller;

    private Vector3 _velocity;
    private bool _groundedPlayer;
    private bool _canDoubleJump;

    [SerializeField] private float playerSpeed = 2.0f;
    [SerializeField] private float jumpHeight = 1.0f;
    [SerializeField] private float gravityValue = -9.81f;

    // Start is called before the first frame update
    void Start()
    {
        _controller = gameObject.GetComponent<CharacterController>();
        if (_controller == null)
        {
            Debug.LogError("Player is missing controller.");
        }
    }

    private void PlayerInput()
    {
        _groundedPlayer = _controller.isGrounded;
        if (_groundedPlayer && _velocity.y < 0)
        {
            _velocity.y = 0;
        }

        var move = new Vector3(Input.GetAxis("Horizontal"), 0, 0);
        _controller.Move(move * (Time.deltaTime * playerSpeed));

        if (move != Vector3.zero)
        {
            gameObject.transform.forward = move;
        }

        if (Input.GetButtonDown("Jump") && _groundedPlayer)
        {
            _velocity.y = Mathf.Sqrt(jumpHeight * -3.0f * gravityValue);
            _canDoubleJump = true;
        }
        else
        {
            if (Input.GetButtonDown("Jump") && _canDoubleJump)
            {
                _velocity.y = Mathf.Sqrt(jumpHeight * -3.0f * gravityValue);
                _canDoubleJump = false;
            }

            _velocity.y += gravityValue * Time.deltaTime;
        }

        _controller.Move(_velocity * Time.deltaTime);
    }
}
