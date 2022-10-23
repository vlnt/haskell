{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_gtk_intro (
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

bindir     = "/home/vlnt/.cabal/bin"
libdir     = "/home/vlnt/.cabal/lib/x86_64-linux-ghc-8.6.5/gtk-intro-0.1.0.0-7WeV82tMVB979Th6h88NCA-gtk-intro"
dynlibdir  = "/home/vlnt/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/vlnt/.cabal/share/x86_64-linux-ghc-8.6.5/gtk-intro-0.1.0.0"
libexecdir = "/home/vlnt/.cabal/libexec/x86_64-linux-ghc-8.6.5/gtk-intro-0.1.0.0"
sysconfdir = "/home/vlnt/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gtk_intro_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gtk_intro_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "gtk_intro_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "gtk_intro_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gtk_intro_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gtk_intro_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
