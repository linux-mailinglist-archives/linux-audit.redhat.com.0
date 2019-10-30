Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 48AA5EA4BA
	for <lists+linux-audit@lfdr.de>; Wed, 30 Oct 2019 21:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572467297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8fRD5S8sl7j9RapRrts1XyKq8xt9D8Csjfo0ixDXNMg=;
	b=S6JqApornuZHAV4XO3Tw4yM7nek6xJ+GcKAoKiL79c/mY3bUMs3t+oh0f8wE8P45lVBVmo
	ZKePRkoZOqC6yzWoM5Jqko+IENy8nHjQSJWPUINaEPMdJWjCc3gX/j/8p2XnYnP0k1B7wE
	02SjPDUkIUPb7/QYhS3eD8MhDCTbkhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-1NZcVbb6OqWJUrQ-MOyhkQ-1; Wed, 30 Oct 2019 16:28:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D6ED1800D55;
	Wed, 30 Oct 2019 20:28:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00CE45C296;
	Wed, 30 Oct 2019 20:28:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9262D18089C8;
	Wed, 30 Oct 2019 20:28:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UKRq8Y031869 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 16:27:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B970A5DA70; Wed, 30 Oct 2019 20:27:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BCD5DA32
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 20:27:50 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D23E010D6E3E
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 20:27:48 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m9so4129671ljh.8
	for <linux-audit@redhat.com>; Wed, 30 Oct 2019 13:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ThGwTwTp4bZorwdaVrJo5UrBBQpibM4/aFgMPeqwm5E=;
	b=N8W4iyP/sRBhrLt/ysGrakL4WFb+Z1Z8TRIyLx2Kza+ks0l/ZX/Ax3dEtaSwLMFdwb
	mwEHtmMSrn+2rPEViqijOX4vfkb9c3Kt4dxFreVlIaigguJd5CJyKS/yx4F1x68cF9eF
	i+V1dHjdvaEEyvB8xu+Y71Cj+rhhcrPVJ1t66Wv4TGlonp3ZHwZasKRb6eBTtFLv0Nen
	DxMsy6bkE3BkK4HhpgGoI4Ji0yvDeMzjQ3ouvAx86nakEUwEq2cInWluR6Timt4vAKOr
	n/337tYTp6OiNz/m80kTXFPFS/O3KDY9UIH94YVSgF4XZDbU+QN7DLIa2UTZZ+rDBcuR
	GTHg==
X-Gm-Message-State: APjAAAXxxiW/kfj+dk0Hers0Ktp3H+InSmqd4lXGbioLhp+OAP5MEhaL
	YB+8wHnyVpfpwiRgra+KmVB2MGmvLw6S1z8DYo6p
X-Google-Smtp-Source: APXvYqwNJV+fESPPSy88I8V9SQJjpifZuNL/1FipNLKwD0hUFyI8ehvSjLCN+oZyru7R02+LN8E0BXtmTH/ZA5bgmuo=
X-Received: by 2002:a2e:58d:: with SMTP id 135mr1059911ljf.57.1572467266987;
	Wed, 30 Oct 2019 13:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
	<CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
	<20191024210010.owwgc3bqbvtdsqws@madcap2.tricolour.ca>
In-Reply-To: <20191024210010.owwgc3bqbvtdsqws@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Oct 2019 16:27:35 -0400
Message-ID: <CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Wed, 30 Oct 2019 20:27:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Wed, 30 Oct 2019 20:27:49 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1NZcVbb6OqWJUrQ-MOyhkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Here's the note I had from that meeting:
>
> - Eric raised the issue that using /proc is likely to get more and more
>   hoary due to mount namespaces and suggested that we use a netlink
> audit message (or a new syscall) to set the audit container identifier
> and since the loginuid is a similar type of operation, that it should be
> migrated over to a similar mechanism to get it away from /proc.  Get
> could be done with a netlink audit message that triggers an audit log
> message to deliver the information.  I'm reluctant to further pollute
> the syscall space if we can find another method.  The netlink audit
> message makes sense since any audit-enabled service is likely to already
> have an audit socket open.

Thanks for the background info on the off-list meeting.  I would
encourage you to have discussions like this on-list in the future; if
that isn't possible, hosting a public call would okay-ish, but a
distant second.

At this point in time I'm not overly concerned about /proc completely
going away in namespaces/containers that are full featured enough to
host a container orchestrator.  If/when reliance on procfs becomes an
issue, we can look at alternate APIs, but given the importance of
/proc to userspace (including to audit) I suspect we are going to see
it persist for some time.  I would prefer to see you to drop the audit
container ID netlink API portions of this patchset and focus on the
procfs API.

Also, for the record, removing the audit loginuid from procfs is not
something to take lightly, if at all; like it or not, it's part of the
kernel API.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

