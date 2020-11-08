Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C71C2AAB30
	for <lists+linux-audit@lfdr.de>; Sun,  8 Nov 2020 14:39:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-hDpqnuwzMWq3eEoTWBtLog-1; Sun, 08 Nov 2020 08:39:00 -0500
X-MC-Unique: hDpqnuwzMWq3eEoTWBtLog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FB221868402;
	Sun,  8 Nov 2020 13:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3FD5C1D7;
	Sun,  8 Nov 2020 13:38:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF71BCF54;
	Sun,  8 Nov 2020 13:38:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A8DcWsX003855 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 8 Nov 2020 08:38:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3FB8B111145B; Sun,  8 Nov 2020 13:38:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3819A1111459
	for <linux-audit@redhat.com>; Sun,  8 Nov 2020 13:38:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD223185A78B
	for <linux-audit@redhat.com>; Sun,  8 Nov 2020 13:38:29 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-258-g8xVd-eTML-hkmQRFFdL7Q-1; Sun, 08 Nov 2020 08:38:27 -0500
X-MC-Unique: g8xVd-eTML-hkmQRFFdL7Q-1
Received: by mail-ed1-f68.google.com with SMTP id cq7so5722636edb.4
	for <linux-audit@redhat.com>; Sun, 08 Nov 2020 05:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eLUI6qJ482h6JkZaFKAhMOIBZuaLNxF5GQhUQ3mLfOY=;
	b=NubSWYFsx7QemMT3Syu3z0wWc6UrLgNgl/cVYlU6z3gbkaJgJOTla+pif7aS6zHIqj
	TdArkZ676AB/xMaWN7ieVxR/np/0PYB2GDUzUBBGe2DRWkIbO2U5fFHOX1A7X3L2p4OC
	7L2N3/Mur0pRYgRJCwDeTzRTyfVL9YkbigDwVFFyrBhFjy8rRqR5DTr6d8w8oykiy49K
	1B6eND6iW8V0EEjWwFj+RImKvhDR4Km2jqK8Pg72jKLIp7c2NFV8cmfoGwsaMEBioAnZ
	eVd2Ts6aZqRMd9+mQA5WDYT6Yi/tp4i5VMDf34UQ36xTSMnfiCfmJaHMRthDCi/I4JJw
	oX9w==
X-Gm-Message-State: AOAM531Bay4BscPuXySOIlERXzOHh1gXy9pUW7JFPx2VtCK4tWxr/ArF
	GsHTX5pbu3HJj+2TuKuxXmzuDC2dqWVUO+b7E9OF
X-Google-Smtp-Source: ABdhPJz46oWmitktxiF4SHErW8/d09tnVwapebMvBMPn23my/f2ERqMvFidV0UtPtEphV9OP/tiyi7KYHcsyuT0R/7E=
X-Received: by 2002:aa7:de01:: with SMTP id h1mr10780950edv.269.1604842705755; 
	Sun, 08 Nov 2020 05:38:25 -0800 (PST)
MIME-Version: 1.0
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
	<20201102220834.GD55072@madcap2.tricolour.ca>
	<6c950188-a516-e9ed-caa5-42de40861596@schaufler-ca.com>
	<20201103011925.GF55072@madcap2.tricolour.ca>
	<CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
	<89a4f320-394e-c9b6-39d9-11f76b22f297@schaufler-ca.com>
In-Reply-To: <89a4f320-394e-c9b6-39d9-11f76b22f297@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 8 Nov 2020 08:38:14 -0500
Message-ID: <CAHC9VhT7+m4D_mfHVxFHrrjwqVyCDPEbCHJAJ-tuJOjC2qPu6A@mail.gmail.com>
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 6, 2020 at 7:52 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> I'm perfectly happy to call it whatever you'd prefer.
> Anything substantive about the test itself?

Nothing jumped out at me.  It's also worth mentioning that the
acceptance bar for the audit-testsuite is much lower than the kernel
for all the usual reasons.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

