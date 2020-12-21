using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EndGame : MonoBehaviour {
    // Use this for initialization
    public static bool flagHit = false;
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
	}

    void OnControllerColliderHit(ControllerColliderHit hit)
    {
        if (hit.gameObject.tag == "EndFlag")
        {
            flagHit = true;
        }
    }

}
