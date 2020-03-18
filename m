Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 42BA218A6C5
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584565845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TlS8KUUh/nY2/sJoNgU1X7GCi/5GGGeiB2I12J3tGVA=;
	b=fMh34LcMkYj3bYKoeUNiIKWQSHbRClYvCH9f31QPbiOq5y5rLO/QYaalmSZVa4l2Z1yDJV
	Yid29CLVInsruw8aKtCUef7tNwJJra+XIiuWwwDhooj7uzgDrysCSHm5dhaS5fdtHiqW23
	k3mfHOwTaWb6ho0H+yuD4QuLYdwIeQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-iVsrlQxNMOOvxclOKIBSEA-1; Wed, 18 Mar 2020 17:10:42 -0400
X-MC-Unique: iVsrlQxNMOOvxclOKIBSEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF61C1005514;
	Wed, 18 Mar 2020 21:10:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E429560BF7;
	Wed, 18 Mar 2020 21:10:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC75A18089CD;
	Wed, 18 Mar 2020 21:10:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IL8mLR006346 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:08:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D821E2063FE6; Wed, 18 Mar 2020 21:08:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D33E52063FE5
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:08:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C21F80028B
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:08:46 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-fo6YMeO2PpKdKWNVB6j-bw-1; Wed, 18 Mar 2020 17:08:44 -0400
X-MC-Unique: fo6YMeO2PpKdKWNVB6j-bw-1
Received: by mail-ed1-f68.google.com with SMTP id z65so32719265ede.0
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WatAKLuqZtZlRLQCbRzYpTXRz9maWKDE4hUEG0f7NDw=;
	b=hQ1xjafSug+U1Mc7JCQCiY8vEg56CEjAU6RErLjVkGOz8uSsyd5kQZ77HPJL/Ie6eg
	9LBG5HGeppvYAoH3hD4DchcI1CGNvVFizqdTzkc3JO4h7MqX7Ml+NuWBCBLZDTGqhXdO
	tgj6sTEMiKtuuQkfI9hrzGD4XYODhUBz0F0oMF4QGXjT1POCd3dJXPchqW32HkLVGQ4Q
	DwBOGDvLY4joRHCyksWlejHuz8Ph/Dj4MkQmI9RvY5mmY8C19ZeK/1oeRTufPdcBS28f
	fEph2KKPMkY8tOA4/dV5mveaXZPNgkyO8enw/OeAzIHTMOmh1zftn0rM0fo2Nb/fVeR8
	0XZA==
X-Gm-Message-State: ANhLgQ2XMYMxYua8dkuz1Ollfzwpg44mFxQU5V5FoZZY90QlZxm03QAp
	2mofYvZQKKgtT1h1tVybv0WW1P0jMjEDc/jSQBab
X-Google-Smtp-Source: ADFU+vvbYGHqEIZHFDpAJYIn0BKyhX1aU7rGbDTvr2tbcPYmEgbd2Lwck7tUApGNIqLuzMQYQdyQBqa6eqOf1oPvVLM=
X-Received: by 2002:aa7:d051:: with SMTP id n17mr5727973edo.196.1584565722903; 
	Wed, 18 Mar 2020 14:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
	<CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
	<20200130192753.n7jjrshbhrczjzoe@madcap2.tricolour.ca>
	<CAHC9VhSVN3mNb5enhLR1hY+ekiAyiYWbehrwd_zN7kz13dF=1w@mail.gmail.com>
	<20200205235056.e5365xtgz7rbese2@madcap2.tricolour.ca>
	<CAHC9VhTM6MDHLcBfwJ_9DCroG0VA-meO770ihjn1sVy6=0JrHw@mail.gmail.com>
	<20200312205147.plxs4czjeuu4davj@madcap2.tricolour.ca>
	<CAHC9VhTqWdXMsbSbsWJzRRvVbSaaFBmnFFsVutM7XSx5NT_FJA@mail.gmail.com>
	<20200314224203.ncyx3rgwwe6zet4e@madcap2.tricolour.ca>
In-Reply-To: <20200314224203.ncyx3rgwwe6zet4e@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:08:31 -0400
Message-ID: <CAHC9VhTy2ou-vadeMjgTaw-T9mW+nBjbqapA7RSW3EFNJ44JLw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02IL8mLR006346
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 14, 2020 at 6:42 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-13 12:47, Paul Moore wrote:

...

> > It has been a while since I last looked at the patchset, but my
> > concern over the prefered use of the ACID number vs the ACID object is
> > that the number offers no reuse protection where the object does.  I
> > really would like us to use the object everywhere it is possible.
>
> Ok, so I take it from this that I go ahead with the dual format since
> the wrapper funciton to convert from object to ID strips away object
> information negating any benefit of favouring the object pointer.  I'll
> look at the remaining calls that use a contid (rather than contobj) and
> convert all that I can over to storing an object using the dual counters
> that track process exits versus signal2 and trace references.

Well, as I said in the other thread, I'm not sure we need a full two
counters; I think one counter and a simple flag should suffice.
Otherwise that sounds good for the next iteration.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

