using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class DespawnOnHeight : MonoBehaviour {
    public static bool characterdeath = false;
    public static int level = 0;
	// Use this for initialization
	void Start () {

	}

    // Update is called once per frame
    void Update () {
		if (transform.position.y < -3) {
            characterdeath = true;
            level = 0;
            SceneManager.LoadScene("GameOver");
        }
	}
}
