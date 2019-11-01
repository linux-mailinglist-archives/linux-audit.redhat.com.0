Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBABEC69A
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 17:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572625374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d/b/+lGXp3NLr1FSXO7uJt+vP1i7KHF3TVkZhWCZuyE=;
	b=frBzzsMWrO6P0CnpB0x47ZBTcW5+YphM/H6Qu4YST6+aSqjHlusOaAc8Ey3NjngH2P9D6y
	FEN8cj66O2gLDItdGvFfYUYx+FAyxWe991bIsblEDD8HRWeaDxHTjK2SNVvLaPRf8mZ32a
	IaZlPQ68oY9hlPjSvnRyI/kbIYIU/KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-f4A39zrsPe-d5kbZo6ziVA-1; Fri, 01 Nov 2019 12:22:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2682C801E5C;
	Fri,  1 Nov 2019 16:22:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A849F60BEC;
	Fri,  1 Nov 2019 16:22:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28ED18089C8;
	Fri,  1 Nov 2019 16:22:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1GMS7W021978 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 12:22:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B6A75C3FD; Fri,  1 Nov 2019 16:22:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8605F5C28E
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 16:22:26 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D3F758F6C
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 16:22:24 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 19so2464467lft.13
	for <linux-audit@redhat.com>; Fri, 01 Nov 2019 09:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P52uQ/03xxtLBhBJNHvX72kCEGcrZADr6ibMXyDJZUc=;
	b=tmSoYyL+WoZK8o2T+qB6gxevvpwFVyFu1Vmos4MYj9jzsoSl4618IzOPuldkkC6LdC
	fyAWWW3Lu9rhxdbIMxucbpjs1QMJyPOcS6glglYR9LFNF9CzfaOIqF+gT/UZr7BY+UoV
	8Uu3eDOtXrlvbc0MtPIFz6q3JnN1VHI1KPaqS9/WoyWFDfs3qK4mZ5dkACDiyw4btjpl
	207iK2mQYZNMhUjn4093nI+VgzhQwA536AJjLk8dtqVfnm1BRkNfH1vYzBki3MNM6VrB
	+R1MHR+tmoQPmnXdLArhtPG1Q3kLnb/64GuqjJYi/FYAO9oCTrmNgX5cpjtSNtYY6WdU
	Ihnw==
X-Gm-Message-State: APjAAAXuWQPuIx30N2k/hKkqkJM3kfw+bDtjqYX1gb+zeJNYrJxnAJE5
	ggtYthtp8efOZRlk702WZd29GyNpxw0SxvyUFZAF
X-Google-Smtp-Source: APXvYqztnAP0ljp8NWIFMkniILElW3dB/q2AiVhtC69W6ZNYYpkmiK7cEliPHB6I2lTRJzaI5MaVEqHJZTKTjHz3SGs=
X-Received: by 2002:ac2:5967:: with SMTP id h7mr7585007lfp.119.1572625342721; 
	Fri, 01 Nov 2019 09:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
	<20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
	<3677995.NTHC7m0fHc@x2>
	<20191101150927.c5sf3n5ezfg2eano@madcap2.tricolour.ca>
In-Reply-To: <20191101150927.c5sf3n5ezfg2eano@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2019 12:22:11 -0400
Message-ID: <CAHC9VhT6ggLxSKV2hM6ZfNcifzJAi_fCSXpTGtyK0nthGk_sWQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Fri, 01 Nov 2019 16:22:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Fri, 01 Nov 2019 16:22:25 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-MC-Unique: f4A39zrsPe-d5kbZo6ziVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2019 at 11:10 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-31 10:50, Steve Grubb wrote:
> > Hello,
> >
> > TLDR;  I see a lot of benefit to switching away from procfs for setting=
 auid &
> > sessionid.
> >
> > On Wednesday, October 30, 2019 6:03:20 PM EDT Richard Guy Briggs wrote:
> > > > Also, for the record, removing the audit loginuid from procfs is no=
t
> > > > something to take lightly, if at all; like it or not, it's part of =
the
> > > > kernel API.
> >
> > It can also be used by tools to iterate processes related to one user o=
r
> > session. I use this in my Intrusion Prevention System which will land i=
n
> > audit user space at some point in the future.
> >
> > > Oh, I'm quite aware of how important this change is and it was discus=
sed
> > > with Steve Grubb who saw the concern and value of considering such a
> > > disruptive change.
> >
> > Actually, I advocated for syscall. I think the gist of Eric's idea was =
that /
> > proc is the intersection of many nasty problems. By relying on it, you =
can't
> > simplify the API to reduce the complexity. Almost no program actually n=
eeds
> > access to /proc. ps does. But almost everything else is happy without i=
t. For
> > example, when you setup chroot jails, you may have to add /dev/random o=
r /
> > dev/null, but almost never /proc. What does force you to add /proc is a=
ny
> > entry point daemon like sshd because it needs to set the loginuid. If w=
e
> > switch away from /proc, then sshd or crond will no longer /require/ pro=
cfs to
> > be available which again simplifies the system design.
> >
> > > Removing proc support for auid/ses would be a
> > > long-term deprecation if accepted.
> >
> > It might need to just be turned into readonly for a while. But then aga=
in,
> > perhaps auid and session should be part of /proc/<pid>/status? Maybe th=
is can
> > be done independently and ahead of the container work so there is a mig=
ration
> > path for things that read auid or session. TBH, maybe this should have =
been
> > done from the beginning.
>
> How about making loginuid/contid/capcontid writable only via netlink but
> still provide the /proc interface for reading?  Deprecation of proc can
> be left as a decision for later.  This way sshd/crond/getty don't need
> /proc, but the info is still there for tools that want to read it.

Just so there is no confusion for the next patchset: I think it would
be a mistake to include any changes to loginuid in your next patchset,
even as a "RFC" at the end.  Also, barring some shocking comments from
Eric relating to the imminent death of /proc in containers, I think it
would also be a mistake to include the netlink API.

Let's keep it small and focused :)

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

