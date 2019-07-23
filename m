Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2571A46
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 16:26:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D2DB3084242;
	Tue, 23 Jul 2019 14:26:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CB060852;
	Tue, 23 Jul 2019 14:26:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBAFF1972F;
	Tue, 23 Jul 2019 14:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6NE6mNi001726 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jul 2019 10:06:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F34D219C78; Tue, 23 Jul 2019 14:06:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9769519C58;
	Tue, 23 Jul 2019 14:06:42 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6BA3300CA3F;
	Tue, 23 Jul 2019 14:06:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a00:5f00:102:0:3aba:f8ff:fe58:9ca1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested) (Authenticated sender: smcv)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9FE1928A8AF;
	Tue, 23 Jul 2019 15:06:36 +0100 (BST)
Date: Tue, 23 Jul 2019 15:06:34 +0100
From: Simon McVittie <smcv@collabora.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Preferred subj= with multiple LSMs
Message-ID: <20190723140634.GA30188@horizon>
References: <CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<CAHC9VhTf0yYDZBxOtfv2E5=GtrBYonoqr46hyBy7qdNdjVLoVg@mail.gmail.com>
	<alpine.LRH.2.21.1907230649460.18217@namei.org>
	<ca22ea45-3f3b-4f79-8d77-7528877b8b36@schaufler-ca.com>
	<CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Tue, 23 Jul 2019 14:06:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 23 Jul 2019 14:06:41 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'smcv@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk <smcv@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 10:25:44 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 23 Jul 2019 14:26:07 +0000 (UTC)

On Mon, 22 Jul 2019 at 18:30:35 -0400, Paul Moore wrote:
> On Mon, Jul 22, 2019 at 6:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > I suggest that if supporting dbus well is assisted by
> > making reasonable restrictions on what constitutes a valid LSM
> > "context" that we have a good reason.
> 
> I continue to believe that restrictions on the label format are a bad
> idea

Does this include the restriction "the label does not include \0",
which is an assumption that dbus is already relying on since I checked
it in the thread around
<https://marc.info/?l=linux-security-module&m=142323508321029&w=2>?
Or is that restriction so fundamental that it's considered OK?

(Other user-space tools like ls -Z and ps -Z also rely on that assumption
by printing security contexts with %s, as far as I know.)

dbus does not require a way to multiplex multiple LSMs' labels in a
printable text string, so from my point of view, multiplexed labels do
not necessarily have to be in what Casey calls the "Hideous" format,
or in any text format at all: anything with documented rules for parsing
(including the unescaping that readers are expected to apply, if there
is any) would be fine. Based on the assumption of no "\0", I previously
suggested a "\0"-delimited encoding similar to /proc/self/cmdline, which
would not need any escaping/unescaping:

    "apparmor\0" <apparmor label> "\0"
    "selinux\0" <SELinux label> "\0"
    ...
    "\0" (or this could be omitted since it's redundant with the length)

which would be fine (indeed, actually easier than the "Hideous" format)
from dbus' point of view.

dbus does not strictly need reading security labels for sockets or
processes to be atomic, either: it would be OK if we can get the complete
list of LSM labels *somehow*, possibly in O(number of LSMs) rather than
O(1) syscalls (although I'd prefer O(1)).

However, the getsockopt() interface only lets the kernel return one thing
per socket option, and I assume the networking maintainers probably don't
want to have to add SO_PEERAPPARMOR, SO_PEERSELINUX... for each LSM -
so this part at least would probably be easier as a single blob in some
text or binary format.

    smcv

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
