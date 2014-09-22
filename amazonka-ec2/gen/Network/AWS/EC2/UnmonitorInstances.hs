{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.UnmonitorInstances
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Disables monitoring for a running instance. For more information about
-- monitoring instances, see Monitoring Your Instances and Volumes in the
-- Amazon Elastic Compute Cloud User Guide. Example This example disables
-- monitoring for the specified instances.
-- https://ec2.amazonaws.com/?Action=UnmonitorInstances
-- &amp;InstanceId.1=i-43a4412a &amp;InstanceId.2=i-23a3397d &amp;AUTHPARAMS
-- &lt;UnmonitorInstancesResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;instancesSet&gt; &lt;item&gt;
-- &lt;instanceId&gt;i-43a4412a&lt;/instanceId&gt; &lt;monitoring&gt;
-- &lt;state&gt;disabled&lt;/state&gt; &lt;/monitoring&gt; &lt;/item&gt;
-- &lt;item&gt; &lt;instanceId&gt;i-23a3397d&lt;/instanceId&gt;
-- &lt;monitoring&gt; &lt;state&gt;disabled&lt;/state&gt; &lt;/monitoring&gt;
-- &lt;/item&gt; &lt;/instancesSet&gt; &lt;/UnmonitorInstancesResponse&gt;.
module Network.AWS.EC2.UnmonitorInstances
    (
    -- * Request
      UnmonitorInstances
    -- ** Request constructor
    , unmonitorInstances
    -- ** Request lenses
    , uiInstanceId

    -- * Response
    , UnmonitorInstancesResponse
    -- ** Response constructor
    , unmonitorInstancesResponse
    -- ** Response lenses
    , uirItem
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.Types
import Network.AWS.Prelude

newtype UnmonitorInstances = UnmonitorInstances
    { _uiInstanceId :: [Text]
    } deriving (Eq, Ord, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UnmonitorInstances' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @InstanceId ::@ @[Text]@
--
unmonitorInstances :: [Text] -- ^ 'uiInstanceId'
                   -> UnmonitorInstances
unmonitorInstances p1 = UnmonitorInstances
    { _uiInstanceId = p1
    }

-- | One or more instance IDs.
uiInstanceId :: Lens' UnmonitorInstances [Text]
uiInstanceId = lens _uiInstanceId (\s a -> s { _uiInstanceId = a })

instance ToQuery UnmonitorInstances where
    toQuery = genericQuery def

newtype UnmonitorInstancesResponse = UnmonitorInstancesResponse
    { _uirItem :: [InstanceMonitoring]
    } deriving (Eq, Ord, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UnmonitorInstancesResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Item ::@ @[InstanceMonitoring]@
--
unmonitorInstancesResponse :: UnmonitorInstancesResponse
unmonitorInstancesResponse = UnmonitorInstancesResponse
    { _uirItem = mempty
    }

-- | Monitoring information for one or more instances.
uirItem :: Lens' UnmonitorInstancesResponse [InstanceMonitoring]
uirItem = lens _uirItem (\s a -> s { _uirItem = a })

instance FromXML UnmonitorInstancesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest UnmonitorInstances where
    type Sv UnmonitorInstances = EC2
    type Rs UnmonitorInstances = UnmonitorInstancesResponse

    request = post "UnmonitorInstances"
    response _ = xmlResponse
