Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 722A7243C23
	for <lists+linux-audit@lfdr.de>; Thu, 13 Aug 2020 17:04:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-Rnumd6F1OBGL_s6xNKcrvA-1; Thu, 13 Aug 2020 11:04:16 -0400
X-MC-Unique: Rnumd6F1OBGL_s6xNKcrvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1FB1005504;
	Thu, 13 Aug 2020 15:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0F062A19;
	Thu, 13 Aug 2020 15:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC1B4181A869;
	Thu, 13 Aug 2020 15:04:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DEuScs023234 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 10:56:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B36B2022789; Thu, 13 Aug 2020 14:56:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46AA72026F94
	for <linux-audit@redhat.com>; Thu, 13 Aug 2020 14:56:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252D685A5B8
	for <linux-audit@redhat.com>; Thu, 13 Aug 2020 14:56:26 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-H0r_7sObOsiiTfNpeJq8fw-1; Thu, 13 Aug 2020 10:56:21 -0400
X-MC-Unique: H0r_7sObOsiiTfNpeJq8fw-1
Received: by mail-il1-f194.google.com with SMTP id t13so5759175ile.9;
	Thu, 13 Aug 2020 07:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=h86jHgXoGDrr6y1H8GyRJonT43XDQUGwHsyIjrhVClo=;
	b=PcjtA72WquiVEoTayK79h4ouDKuU3R6FFRQKvaK6m+giwek233klAZ57Mx2W3bQErz
	ViZ3xwrjeoW4ve5Lu9lzMmismO6zOpqcdDKt5jjMqEbqW1O6ZHOYGJlXdcxpYoJ/V//T
	CIDQkVAK1KZ3AgOkPPqUU9pYFN9llq8KMOaReQ8014n2a6qOtY4K0IhKFKP7pl4PWRZk
	JJKdiywJuyCJvZn6FSX81YoS+j5jViVMR3JUSYMNu+57TIj+Lv/aLW73qzZiGsOjwQQw
	5jrdshOKSBnkTpoVrpNn+U15WqS4SE4UFYLSunSDjZ27oBJMHwGcgC+HAZUBG+24HZ8L
	d0/w==
X-Gm-Message-State: AOAM532w2Z+KquI4iSGey0emtPkgyusx19hE6aXkTrVpYg41STeCzU+Z
	WXD2v88/YUJcy7BeD9WBLf4=
X-Google-Smtp-Source: ABdhPJyufAWBDkWl0rbFsm4iCNiuMOHAC/vQfunIPsTD3bDPGN/H0DAGcWooZcr1d23PB42mHpq9Dw==
X-Received: by 2002:a92:99ca:: with SMTP id t71mr2876299ilk.143.1597330580641; 
	Thu, 13 Aug 2020 07:56:20 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	p13sm2089843ilb.61.2020.08.13.07.56.18
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2020 07:56:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement LSM
	(IPE)
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597329763.3708.13.camel@HansenPartnership.com>
Date: Thu, 13 Aug 2020 10:56:17 -0400
Message-Id: <49A45475-20D8-456E-92AD-F63DBC71F900@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
	<1597170509.4325.55.camel@HansenPartnership.com>
	<2CA41152-6445-4716-B5EE-2D14E5C59368@gmail.com>
	<1597246946.7293.9.camel@HansenPartnership.com>
	<3F328A12-25DD-418B-A7D0-64DA09236E1C@gmail.com>
	<1597329763.3708.13.camel@HansenPartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DEuScs023234
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 13 Aug 2020 11:02:55 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 13, 2020, at 10:42 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Thu, 2020-08-13 at 10:21 -0400, Chuck Lever wrote:
>>> On Aug 12, 2020, at 11:42 AM, James Bottomley <James.Bottomley@Hans
>>> enPartnership.com> wrote:
> [...]
>>> For most people the security mechanism of local xattrs is
>>> sufficient.  If you're paranoid, you don't believe it is and you
>>> use EVM.
>> 
>> When IMA metadata happens to be stored in local filesystems in
>> a trusted xattr, it's going to enjoy the protection you describe
>> without needing the addition of a cryptographic signature.
>> 
>> However, that metadata doesn't live its whole life there. It
>> can reside in a tar file, it can cross a network, it can live
>> on a back-up tape. I think we agree that any time that metadata
>> is in transit or at rest outside of a Linux local filesystem, it
>> is exposed.
>> 
>> Thus I'm interested in a metadata protection mechanism that does
>> not rely on the security characteristics of a particular storage
>> container. For me, a cryptographic signature fits that bill
>> nicely.
> 
> Sure, but one of the points about IMA is a separation of mechanism from
> policy.  Signed hashes (called appraisal in IMA terms) is just one
> policy you can decide to require or not or even make it conditional on
> other things.

AFAICT, the current EVM_IMA_DIGSIG and EVM_PORTABLE_DIGSIG formats are
always signed. The policy choice is whether or not to verify the
signature, not whether or not the metadata format is signed.


--
Chuck Lever
chucklever@gmail.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

