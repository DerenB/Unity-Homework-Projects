using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuitMenu : MonoBehaviour 
{
    // Closes the Prorgam
    public void Quit()
    {
        Debug.Log("Closing Applicaiton");
        Application.Quit();
    }
}
