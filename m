Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3D785EBAA6
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 00:38:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572565116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZHnF5GkJUQycrut8dbG2Vhv8P9/nrgdd97HVvl4UbK8=;
	b=S0K2LynJBWgNOMl8zrTbQE7aCrrfxEpBixQ0u8SEnpLsqf/MszR1CUVCUNIqnQpn81Cz6Z
	ewO2MLY/nZXRoMTz1zTCdBi1Hw+KEeK5W1t0soXbMIpsKyuJYn3ebkps3qXWeYheSPtbbF
	zyTUPM48fC17DsFtxLpvHkTpHGd/Fg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-VMl2VxeDMy6ag6lpd5X0BA-1; Thu, 31 Oct 2019 19:38:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393D4800EB5;
	Thu, 31 Oct 2019 23:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F9E10016E8;
	Thu, 31 Oct 2019 23:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98EB31803C32;
	Thu, 31 Oct 2019 23:38:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VNc4wF019072 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 19:38:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA5E0600CD; Thu, 31 Oct 2019 23:38:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3BC9600CE
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 23:38:01 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1450E10C72CA
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 23:38:01 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q64so8382336ljb.12
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 16:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BhXMszijrgAIYzZ9gxH9cFx8EddXNjy2TqQatbYc+Nk=;
	b=XQEJzOyYzP7j3Ueiv7zRVE9UERJlsXw7eKCLM8Dp99ZwuWTkoCoSQdMBQMjgO/Xiqk
	oLC6OvUgBBLXJnCMpJA+ahluF4VcuLF97e3h3dEzgYXVYHXxiW1LVJV7K5aV5ZHMx2CX
	GidQJdtGjEScOfbRQQ89KDbPCM8GRoBTkvH84KpnORs9eR6Fr3TlPu1l9G/5WqSTo+kf
	I0vNAiqJAkHI811X+pDHxKdIbAVhEiARDMW8INeupBZWHTZJxHHiN8r9L0rIffyWJiWr
	wU4yXMkWbFWsAtDmE2AWFr4jxcemYY/Fl/9psqpgQk73ezRswOr9bFh8p+LAdc8H5JGw
	V0qA==
X-Gm-Message-State: APjAAAX3YeH2QEoGJ0ykCZxwDAPKMC/JRdfwIhNxQL0JhiphT7I+OYkq
	+qmy/aveMm4sxRm5WxFAlKz7ZIRG/avlgd6VwZMW
X-Google-Smtp-Source: APXvYqy8BRCKDLBn26Bkj59INhzmzbXz5OoQirpWl9olE5rViDzVr+PfQj3xwew3Q+hP7oK7j+pufcBguSFvNfQncXo=
X-Received: by 2002:a2e:9249:: with SMTP id v9mr6136219ljg.184.1572565079262; 
	Thu, 31 Oct 2019 16:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
	<3677995.NTHC7m0fHc@x2>
In-Reply-To: <3677995.NTHC7m0fHc@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 31 Oct 2019 19:37:47 -0400
Message-ID: <CAHC9VhQ6Jq5kfrBZ21t9oFR9pYe5gxE2FxLPq27PcSCz4oFauA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Thu, 31 Oct 2019 23:38:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Thu, 31 Oct 2019 23:38:01 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VMl2VxeDMy6ag6lpd5X0BA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 10:51 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > > Also, for the record, removing the audit loginuid from procfs is not
> > > something to take lightly, if at all; like it or not, it's part of th=
e
> > > kernel API.
>
> It can also be used by tools to iterate processes related to one user or
> session. I use this in my Intrusion Prevention System which will land in
> audit user space at some point in the future.

Let's try to stay focused on the audit container ID functionality; I
fear if we start bringing in other unrelated issues we are never going
to land these patches.

> > Oh, I'm quite aware of how important this change is and it was discusse=
d
> > with Steve Grubb who saw the concern and value of considering such a
> > disruptive change.
>
> Actually, I advocated for syscall. I think the gist of Eric's idea was th=
at /
> proc is the intersection of many nasty problems. By relying on it, you ca=
n't
> simplify the API to reduce the complexity.

I guess complexity is relative in a sense, but reading and writing a
number from a file in procfs seems awfully simple to me.

> Almost no program actually needs
> access to /proc. ps does. But almost everything else is happy without it.=
 For
> example, when you setup chroot jails, you may have to add /dev/random or =
/
> dev/null, but almost never /proc. What does force you to add /proc is any
> entry point daemon like sshd because it needs to set the loginuid. If we
> switch away from /proc, then sshd or crond will no longer /require/ procf=
s to
> be available which again simplifies the system design.

It's not that simple, there are plenty of container use cases beyond
ps which require procfs:

Most LSM aware applications require procfs to view and manage some LSM
state (e.g. /proc/self/attr).

System containers, containers that run their own init/systemd/etc.,
require a working procfs.

Nested container orchestrators often run in system containers, which
require a working procfs (see above).

I'm sure there are plenty others, but these are the ones that came
immediately to mind.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

