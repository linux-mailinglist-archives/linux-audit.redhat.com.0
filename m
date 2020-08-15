Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EE6302454B0
	for <lists+linux-audit@lfdr.de>; Sun, 16 Aug 2020 00:38:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-kVnHFGHwPeyFbV1__wZbpA-1; Sat, 15 Aug 2020 18:38:37 -0400
X-MC-Unique: kVnHFGHwPeyFbV1__wZbpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3609802B47;
	Sat, 15 Aug 2020 22:38:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D810194B9;
	Sat, 15 Aug 2020 22:38:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9F034EE17;
	Sat, 15 Aug 2020 22:38:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07FMa37D005772 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 18:36:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9154C2166BD9; Sat, 15 Aug 2020 22:36:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4812166BB3
	for <linux-audit@redhat.com>; Sat, 15 Aug 2020 22:35:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD7D8102F1E1
	for <linux-audit@redhat.com>; Sat, 15 Aug 2020 22:35:58 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-80-jg5wOUBPNGa4PX90M9VUqA-1; Sat, 15 Aug 2020 18:35:56 -0400
X-MC-Unique: jg5wOUBPNGa4PX90M9VUqA-1
Received: by mail-ej1-f65.google.com with SMTP id o23so13643906ejr.1
	for <linux-audit@redhat.com>; Sat, 15 Aug 2020 15:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dTQO2UGS6IbiCmBPjV1qZIfUiVzOZUUnWY06F94c99c=;
	b=aPxWEAohnRBGbBMzQoO2D6gZypgPzLfGLzUGfdBr+WRnBx1aRkLGLV7VRSbSEqjKAQ
	ED2WMob4PLxnRlhI50/QWOyUyirBMX6vwNri3mOJ5iHGRUZvCgTmiY+S+EbM0Ji/dLxk
	Qcq126uNBQkzMEyLzTRlQmmXGTki32C3TN93refQhW2KVA3M3PMXIwdDyEm9GePyiSDK
	CU+RbAdO6WFfBBe8cFHkL1UrL61mMWETn+kWcld58ZIBwvNkFI7eNoxrYz6ZUsgJbJzj
	M8yjanyLE9qZxCc2arPFgTbnIhNq0bX5N6gCnrtpokMLNWi6YOBIkdCdkKMH3mmJGCVQ
	OHdA==
X-Gm-Message-State: AOAM5326UkSefpcU6wRP+Wf9fJqrmYrNLTXVPHoyTH9PvmzUxujZKiSU
	2EBz/8SlQxTrRWs56X2zIopMrCuZnqaOmgPUdJ7g
X-Google-Smtp-Source: ABdhPJwajHLy4Cpu9WC5K51l5XAs5s1YBGBAGWUzquqWkkmQK36cRloxe0v45CqP0jbqneMTpEefGiKzcZkmjxRpt3A=
X-Received: by 2002:a17:907:20e1:: with SMTP id
	rh1mr8294271ejb.106.1597530954556; 
	Sat, 15 Aug 2020 15:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200809063600.GC1538@shao2-debian>
	<20200814230851.sn4oiddwcaoqhvso@madcap2.tricolour.ca>
In-Reply-To: <20200814230851.sn4oiddwcaoqhvso@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 15 Aug 2020 18:35:43 -0400
Message-ID: <CAHC9VhRUoM1j7rqOvtzHcSUq9C6x19WREMfpQF1cWC6B-um-zg@mail.gmail.com>
Subject: Re: [audit] c4dad0aab3: canonical_address#:#[##]
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: lkp@lists.01.org, Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel test robot <rong.a.chen@intel.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 14, 2020 at 7:09 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-08-09 14:36, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with clang-12):
> >
> > commit: c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426 ("audit: tidy and extend netfilter_cfg x_tables")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: trinity
> > with following parameters:
> >
> >       runtime: 300s
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
> This looks odd to me.  I don't see any audit involved in this and I've
> heard other complaints that this bot has appeared to mis-attribute other
> errors.  I had a quick look before I went on vacation a week ago and was
> back today briefly.  I'll be away until the 24th and won't be able to
> look before then.

I am just getting back to normal network access myself, but I did have
a brief exchange with Richard about this and I agree it looks a bit
odd.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

