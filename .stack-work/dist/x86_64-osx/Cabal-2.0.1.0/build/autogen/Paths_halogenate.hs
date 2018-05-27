{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_halogenate (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/bin"
libdir     = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/lib/x86_64-osx-ghc-8.2.2/halogenate-0.1.0.0-HCedJ8FIwsT3lBOo7G13xG"
dynlibdir  = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/share/x86_64-osx-ghc-8.2.2/halogenate-0.1.0.0"
libexecdir = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/libexec/x86_64-osx-ghc-8.2.2/halogenate-0.1.0.0"
sysconfdir = "/Users/ninjarab/Playground/Haskell/halogenate/.stack-work/install/x86_64-osx/lts-11.10/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "halogenate_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "halogenate_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "halogenate_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "halogenate_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "halogenate_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "halogenate_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
