Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6070C30CE78
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 23:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612303932;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pFhU9tXQX0jN6mQYQH2Gtva+jX63dEBXvbDCXrdVofc=;
	b=b1mJzpT3tV0aQ3hpcPjp3lAwbYToxthyqrD3oB7NTAy3mEeX9KyImVICtP5+4DMU+6s+JO
	flM/yTDhyXi+sh6DgNgLNrJXmoPA4TrNxSODdQAbRexbK2uiGls98VHMNFyjyhjtcwBt/X
	sSfE76RbNvLC4oPtacq+ofiR6vpxAlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-KN7xF1IOPu-KqBmjZqzW4w-1; Tue, 02 Feb 2021 17:12:05 -0500
X-MC-Unique: KN7xF1IOPu-KqBmjZqzW4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12BB9107ACFC;
	Tue,  2 Feb 2021 22:12:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4FB5D9E3;
	Tue,  2 Feb 2021 22:12:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D04C318095CB;
	Tue,  2 Feb 2021 22:11:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112MBT1c020319 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 17:11:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB1F2AE7D4; Tue,  2 Feb 2021 22:11:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A4FEAF84
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 22:11:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E223800157
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 22:11:27 +0000 (UTC)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
	[209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-532-FPX6EOOfM7iTvIsmlCpY6Q-1; Tue, 02 Feb 2021 17:11:25 -0500
X-MC-Unique: FPX6EOOfM7iTvIsmlCpY6Q-1
Received: by mail-lf1-f69.google.com with SMTP id p12so4996341lfu.7
	for <linux-audit@redhat.com>; Tue, 02 Feb 2021 14:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VpgWM/abuu0TQrIRbjQU0gPGa4Gz1AqWL2PjDpQS6SU=;
	b=Rw/8U3BuQTA/Amzpc6YucRzv5hw87WxbNo1vb971spCrBlryfeTju7LBTJlRyPIPiT
	3E1XUrJNqr1trSQQyxoWIydfT5Jx/zWhJv4wKqfEnAWff0/v/7hLCd3mkuNBAnKY3HXA
	o+qyjnwwp7uavcyJffhMzghb/rqGMr8n1aXl+9oSdqm1EC3s4mB68OX0grJb4SrP5Okp
	3LUMDI36mpXGok7j+QohDvSfyKoaYqB1srDWwMQadESHZsx983oVyn9km6OIb4S5gKgm
	TtBehPfpKiBNFgxKkszLfZC2GJ/hhejzNZ9GRunAjjrIg+JR0WFGHmH4TBwr8qtCoCq0
	RAMg==
X-Gm-Message-State: AOAM530t38i1Svip6DoNjgThjJBUZclVsUkNnTP7RRqjPeIOixcKYwiB
	Y/opMdpWqiWnfTsAlJUIPSjxVYiMAsjjdC3+Jnw6vZwna1hZOBbux8dhtGTGuQW7gmUk3J8osw5
	saT0FzktxStKRq0eNYUHlEagH/PUzN8UOgtM=
X-Received: by 2002:a19:7403:: with SMTP id v3mr28279lfe.67.1612303884022;
	Tue, 02 Feb 2021 14:11:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG2tuetzkIl/9/aGTkkG1GCcsDk3ZS+fx56+MYmsFDp8xUqUXyNP/1lCpSUkhjchhEL7K5ygz/gh7N0JwmERQ=
X-Received: by 2002:a19:7403:: with SMTP id v3mr28269lfe.67.1612303883741;
	Tue, 02 Feb 2021 14:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20210202212930.18845-1-danielwa@cisco.com>
	<CAHC9VhShkEJHWmuE2C_RLQy-Z3CpvAhTj68ki22v=AKF5hfvrQ@mail.gmail.com>
	<20210202214357.GD3710@zorba>
	<CAHC9VhSVBV=_pBnj7sxwJu0siXx5P7JrsYSz1_vW3j6WmTw+6w@mail.gmail.com>
In-Reply-To: <CAHC9VhSVBV=_pBnj7sxwJu0siXx5P7JrsYSz1_vW3j6WmTw+6w@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Tue, 2 Feb 2021 23:11:12 +0100
Message-ID: <CAFqZXNtRYNQNTfTM_QkeS__YFYSVgkvkZW0EWD=t7KacEeE4Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] audit: show user land backtrace as part of audit
	context messages
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "Victor Kamensky \(kamensky\)" <kamensky@cisco.com>,
	"Ruslan Bilovol -X \(rbilovol - GLOBALLOGIC INC at Cisco\)"
	<rbilovol@cisco.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>,
	"Daniel Walker \(danielwa\)" <danielwa@cisco.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 2, 2021 at 10:46 PM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Feb 2, 2021 at 4:44 PM Daniel Walker (danielwa)
> <danielwa@cisco.com> wrote:
> > On Tue, Feb 02, 2021 at 04:35:42PM -0500, Paul Moore wrote:
> > > On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > > From: Victor Kamensky <kamensky@cisco.com>
> > > >
> > > > To efficiently find out where SELinux AVC denial is comming from
> > > > take backtrace of user land process and display it as type=UBACKTRACE
> > > > message that comes as audit context for SELinux AVC and other audit
> > > > messages ...
> > >
> > > Have you tried the new perf tracepoint for SELinux AVC decisions that
> > > trigger an audit event?  It's a new feature for v5.10 and looks to
> > > accomplish most of what you are looking for with this patch.
> > >
> > > * https://www.paul-moore.com/blog/d/2020/12/linux_v510.html
> >
> > We haven't tried it, but I can look into it. We're not using v5.10 extensively
> > yet.
>
> Let us know if that works for you, and if it doesn't, let us know what
> might be missing.  I hate seeing the kernel grow multiple features
> which do the same thing.

I agree - I played around with this new tracepoint recently and you
can use it to achieve what you want quite easily:

# collect traces for denials (just interrupt/kill the sleep process
when done) - will create a perf.data file you can analyze later
perf record -a -e avc:selinux_audited -g --call-graph=dwarf sleep infinity
# dump all collected backtraces from the perf.data file
perf script

It's a bit complicated if you want to have it running in the
background permanently as a service (you need to tell perf to dump the
recorded data before you can read it), but perf already has some
command-line options to help with that use case.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

