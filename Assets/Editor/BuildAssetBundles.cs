using UnityEditor;
using UnityEngine;

public class BuildAssetBundles
{
    [MenuItem("Assets/Build AssetBundles")]
    static void BuildAllAssetBundles()
    {
        string assetBundleDirectory = "Assets/AssetBundles";

        if (!System.IO.Directory.Exists(assetBundleDirectory))
        {
            System.IO.Directory.CreateDirectory(assetBundleDirectory);
        }

        // Опции для сборки AssetBundle
        // BuildAssetBundleOptions options = BuildAssetBundleOptions.ForceRebuildAssetBundle |
        //                                   BuildAssetBundleOptions.CollectDependencies |
        //                                   BuildAssetBundleOptions.CompleteAssets |
        //                                   BuildAssetBundleOptions.StrictMode;

        BuildPipeline.BuildAssetBundles(assetBundleDirectory, BuildAssetBundleOptions.None, BuildTarget.iOS);

        Debug.Log("AssetBundles successfully built for iOS at: " + assetBundleDirectory);
    }
}
