Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C276CEA4
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jul 2019 15:13:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFCFC307D853;
	Thu, 18 Jul 2019 13:13:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F725C21A;
	Thu, 18 Jul 2019 13:13:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE9DC264C9;
	Thu, 18 Jul 2019 13:13:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IDAjeT032073 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 09:10:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16AFF60CBC; Thu, 18 Jul 2019 13:10:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD54860F82;
	Thu, 18 Jul 2019 13:10:40 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A70B13092652;
	Thu, 18 Jul 2019 13:10:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a00:5f00:102:0:3aba:f8ff:fe58:9ca1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested) (Authenticated sender: smcv)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D92DF28A357;
	Thu, 18 Jul 2019 14:10:36 +0100 (BST)
Date: Thu, 18 Jul 2019 14:10:34 +0100
From: Simon McVittie <smcv@collabora.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: Preferred subj= with multiple LSMs
Message-ID: <20190718131034.GA12581@horizon>
References: <d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 18 Jul 2019 13:10:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 18 Jul 2019 13:10:39 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'smcv@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk <smcv@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Jul 2019 09:12:48 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 18 Jul 2019 13:13:18 +0000 (UTC)

On Wed, 17 Jul 2019 at 16:02:16 -0700, Casey Schaufler wrote:
> We've never had to think about having general rules on
> what security modules do before, because with only one
> active each could do whatever it wanted without fear of
> conflict. If there is already a character that none of
> the existing modules use, how would it be wrong to
> reserve it?
> 
> Smack disallows the four characters '"/\ because quoting
> is too important to ignore and the likelyhood that someone
> would confuse labels with paths seemed great. I sniffed
> around a little, but couldn't find the sets for SELinux or
> AppArmor.

It seems we've been here before, when I added LinuxSecurityLabel to
https://dbus.freedesktop.org/doc/dbus-specification.html#bus-messages-get-connection-credentials
in D-Bus.

Recapping the context for those who might have missed it: in D-Bus,
processes communicate in a hub-and-spoke topology via a central message
bus process, which forwards messages between the other processes. Some
other IPC systems would call this a broker. As a result of this
indirection, the message bus is the only process in the overall system
that is in a position to ask the kernel for the identity of the other
processes (credentials(7) and related topics like LSM labels) using
unforgeable kernel-guaranteed socket options like SO_PEERCRED, SO_PEERSEC
and SO_PEERGROUPS. This means that if two processes communicate via D-Bus
and want to know each other's identities, they have to ask the message
bus; so the message bus needs a representation for that information. For
LSM labels, that representation is LinuxSecurityLabel, which is defined
in terms of SO_PEERSEC.

At the time that I defined LinuxSecurityLabel, nobody was willing to
say for sure that the label was guaranteed to be ASCII or UTF-8 (which
is part of the specification for the D-Bus STRING ('s') type), so I
had to encode it as an arbitrary ARRAY of BYTE ('ay') rather than as
a STRING. I was at least told that the label wouldn't contain embedded
'\0', and that if there is a trailing '\0', I can safely canonicalize
the string by removing it.

Also, at the time that I did that, nobody was willing to say for sure
that there was any particular correspondence between the security
label obtained by reading /proc/self/attr/current and the security
label obtained by getting the SO_PEERSEC socket option: in AppArmor,
/proc/self/attr/current is something like "unconfined\n" whereas
SO_PEERSEC is either "unconfined" or "unconfined\0" (I forget which),
but the consensus seemed to be that there is no guarantee that the
presence or absence of a trailing newline wouldn't be significant to
some non-AppArmor LSM.

If LSM stacking is going to lead to syntactic restrictions being imposed
on security labels, please could someone add them to credentials(7)
or some other suitable documentation so user-space developers can know
where we stand, or tell me what the restrictions and guarantees are so
I can propose a documentation patch?

Thanks,
    smcv

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
