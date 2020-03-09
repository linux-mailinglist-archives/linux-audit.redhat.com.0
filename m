Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B27FA17E639
	for <lists+linux-audit@lfdr.de>; Mon,  9 Mar 2020 19:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583776826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HxoWRZR+BVNdEQNtuStO2kQ2Xfi90NglwxNdslxSHCM=;
	b=JocphWc/lEqu0lWFk6R27UM49kcPzRfdKekWtI9LSLQv5glGpA/w8JeUBgq8jXJKpNmLdH
	AS17T79HNs/IfNTC/N7iG0oylAZAAKlR2gdgUWMvFM+BUEB8TZvtFJ7+bBaXM3HLshhEpM
	UvjfwC9OLRxVad27k2SifmFDl6DXyHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-fcmnHuYEMdG9HZZuWUS_0w-1; Mon, 09 Mar 2020 14:00:24 -0400
X-MC-Unique: fcmnHuYEMdG9HZZuWUS_0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7338017DF;
	Mon,  9 Mar 2020 18:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0DC5DA7B;
	Mon,  9 Mar 2020 18:00:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 132AB4EA66;
	Mon,  9 Mar 2020 18:00:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029I05Hd024390 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 14:00:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B15012166B30; Mon,  9 Mar 2020 18:00:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD15A2166B2F
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 18:00:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 110B6185A78E
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 18:00:03 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-cjMXM1YtMQu2pUyiLRnssg-1; Mon, 09 Mar 2020 14:00:00 -0400
X-MC-Unique: cjMXM1YtMQu2pUyiLRnssg-1
Received: by mail-ed1-f49.google.com with SMTP id c21so13097280edt.1
	for <linux-audit@redhat.com>; Mon, 09 Mar 2020 11:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0sngC6F5VCOOsiyiK/twdCBTgDJ3a8iFpmd4MIA1XTM=;
	b=ntsdi8vC3mLroJnUCayKjOGwJwc7Sjqk835KEGxsxp2IS10GMCerAlYQ62ybh27HzN
	jBqrCCePzs/ksnEDr88FHB5YJJDUAVTzEuCf3c80NTycgvrttxfHON+yGBgn4oEOi1pO
	2MQXD19C7DTBALfHCicXZMwk9/k2G9eQjvnhVyTIiLyNuji3V++c8QOY/2ouyY3efn3X
	FsWVd+nFA701KucT4QhqADQYz2R4v0BlDKmSvihqUEeSHInHqpSFENOy9Ozrjv5I/mf6
	ECVNSj6GaHmgmTrfwqcS7IfCtC2Vuxes8NOHO4VVIYzL+YfX58OY0JZ2NNVOpTui31F/
	AjLQ==
X-Gm-Message-State: ANhLgQ1tuG0RncrAG/sHajKCZzFmFlgNewJHqG7g/nUnPKPU9011+xdg
	lz89T794CdaQ9KLHZEhOoCrFubM6/jCvSWlb48vntMI=
X-Google-Smtp-Source: ADFU+vvh3k0t9iKJJWKmneYLoiPivLy08kmJYQugG/B/PA/HculZFjV13YAXrc0wcfiXWfrPLm+2Ei48QKyULwN0tYg=
X-Received: by 2002:a17:907:9d8:: with SMTP id
	bx24mr16131345ejc.271.1583776798908; 
	Mon, 09 Mar 2020 10:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-14-casey@schaufler-ca.com>
	<CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
	<42b3a4f0-c6ee-516a-7d10-726222c42b78@schaufler-ca.com>
In-Reply-To: <42b3a4f0-c6ee-516a-7d10-726222c42b78@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Mar 2020 13:59:48 -0400
Message-ID: <CAHC9VhRiqHAJLBNLxLrFHsevSdV0bG_P_YFWV6Kw00ZGTKduHw@mail.gmail.com>
Subject: Re: [PATCH v15 21/23] Audit: Include object data for all security
	modules
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029I05Hd024390
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 9, 2020 at 1:45 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 3/6/2020 6:31 PM, Paul Moore wrote:
> > Either way, the "obj=" field should stay where it is, but the
> > "obj_XXX=" fields need to find their way to the end of the record.
>
> As Steve pointed out, there may be a bigger issue here. If the additional
> fields aren't going to fit in MAX_AUDIT_MESSAGE_LENGTH bytes another
> format may be required. I had hoped that perhaps obj_selinux= might count
> as a refinement to obj= and hence not be considered a new field, but
> it looks like that's not flying.

Regardless, the field placement guidance remains the same.

As far as the record limitation; yes, Steve's audit userspace does
have a limit, but I do wonder how limiting an 8k record size really is
for the majority of systems.  My guess is "not too bad".  If you are
concerned about that, I imagine you could always tack on a new record
to relevant events with additional LSM subj/obj info.  Some of the
audit container ID pre-work have made that less painful than it would
have been in the past, but it will still be a bit of work to get it
right.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

