Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 34FA12359F9
	for <lists+linux-audit@lfdr.de>; Sun,  2 Aug 2020 20:42:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-2yOFeyPkO-qD6d_h27fg0Q-1; Sun, 02 Aug 2020 14:42:04 -0400
X-MC-Unique: 2yOFeyPkO-qD6d_h27fg0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ACC21893DC3;
	Sun,  2 Aug 2020 18:41:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCE887E25;
	Sun,  2 Aug 2020 18:41:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8C051800BB2;
	Sun,  2 Aug 2020 18:41:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 072EXsJX013337 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 10:33:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D603B2029F60; Sun,  2 Aug 2020 14:33:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12222026D67
	for <linux-audit@redhat.com>; Sun,  2 Aug 2020 14:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8F398007CA
	for <linux-audit@redhat.com>; Sun,  2 Aug 2020 14:33:52 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-50-KKZ0ACMePhqj2o0u2WTk7w-1; Sun, 02 Aug 2020 10:33:50 -0400
X-MC-Unique: KKZ0ACMePhqj2o0u2WTk7w-1
Received: by mail-wr1-f68.google.com with SMTP id 88so31869395wrh.3;
	Sun, 02 Aug 2020 07:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
	:references:mime-version;
	bh=9PypgIJJvqCkuITTRt+jUQNytQ0pFV6e29FYNAjaOQI=;
	b=YsPUBxdTHGjY0y2a9VCAcsY6+VTa0fzoEdfXCZVxUyXnag18CYCNZKWvCpvElHSv3G
	IwlVPeeeoaFZlFGjnv+yffT0AVfxVW5MbY3f3bK1cWMN4DaskmSp8jvhPwSVcxn+89M6
	aDVZgBegp/BWBoUgASwu81kcuA3B+lyytBqN2zUAgOVzaSF6HR/hKBbBlsEGvQatsY2p
	DHCidaQNwxW2DB8bzpI6jrZutPXH/AWe28vRppSS6kQQd/j09f1YDsAI5jJw4OSjTuPv
	fGyxz5w1cD0XoyqKpONxPyEKwr+JJ3b/V/CHlXMFeBHvHNtsQWiZEJkoI8TcHGlAQ2Gu
	EYSw==
X-Gm-Message-State: AOAM532y5f77LTn8q2bceKr8RNtL5InIkVmyFHCcKgQFslQjiIbcT6AD
	tarHm6EKxHtXtZyOkLZDTQ==
X-Google-Smtp-Source: ABdhPJxkyEK4zEDcm+4mNuuJfAt3gDqkJE2+5x+uhhWY3j7yLicvVYKcHNXsNx3cJ/2grxK4gGR3yw==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr11961751wrs.132.1596378828966;
	Sun, 02 Aug 2020 07:33:48 -0700 (PDT)
Received: from localhost.localdomain (host-92-25-238-49.as13285.net.
	[92.25.238.49]) by smtp.gmail.com with ESMTPSA id
	v67sm21189228wma.46.2020.08.02.07.33.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Aug 2020 07:33:48 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
X-Google-Original-From: Jules Irenge <jules@gmail.com>
Date: Sun, 2 Aug 2020 15:32:08 +0100 (BST)
X-X-Sender: jules@localhost
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/4] audit: uninitialize global variable audit_sig_sid
In-Reply-To: <91c6c45f0d8ec0d031c216711cd8d7f6e9aad7ad.camel@perches.com>
Message-ID: <alpine.LFD.2.23.451.2008021356020.85114@localhost>
References: <0/4> <20200801184603.310769-1-jbi.octave@gmail.com>
	<20200801184603.310769-3-jbi.octave@gmail.com>
	<91c6c45f0d8ec0d031c216711cd8d7f6e9aad7ad.camel@perches.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 02 Aug 2020 14:41:38 -0400
Cc: Jules Irenge <jbi.octave@gmail.com>,
	"moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 1 Aug 2020, Joe Perches wrote:

> On Sat, 2020-08-01 at 19:46 +0100, Jules Irenge wrote:
> > Checkpatch tool reports an error at variable audit_sig_sid declaration
> []
> > diff --git a/kernel/audit.c b/kernel/audit.c
> []
> > @@ -125,7 +125,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
> >  /* The identity of the user shutting down the audit system. */
> >  kuid_t		audit_sig_uid = INVALID_UID;
> >  pid_t		audit_sig_pid = -1;
> > -u32		audit_sig_sid = 0;
> > +u32		audit_sig_sid;
> 
> All of these are unused outside of audit.c and might as
> well be static and removed from the .h file.
> 

Thanks for reply, I will resend a second version with the recommendation,  
namely make the above static and remove them from the .h file.

Jules

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

