Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A0861EC4FD
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 15:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572619771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y6ZhDYcid0Vy4CTMuPD/GUP/B3frsB8/Q/c4KCqgFgg=;
	b=DmjnhfmnxrkVd2op0q9p4vTbD0ZowP5UFE4JQ955/cLzU9hodcyKiF0Ox6lndU4TT2DLfg
	YhoLv3zII2l7jw6YblDOZz3JN3sj68affwf7le+WUJ22LnMhcmgWPG6HigGi+KTXM0p3Hw
	+KotUWoFXpNKy1su/7MGtf4F+VF+Lx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-PfCX3WVXOHaaxRkawDa9jQ-1; Fri, 01 Nov 2019 10:49:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA7C1800D67;
	Fri,  1 Nov 2019 14:49:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58EA8600F8;
	Fri,  1 Nov 2019 14:49:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2D3F18034E9;
	Fri,  1 Nov 2019 14:49:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1En9WA013334 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 10:49:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7984D600D1; Fri,  1 Nov 2019 14:49:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-239.phx2.redhat.com [10.3.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46040600F8;
	Fri,  1 Nov 2019 14:49:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
Date: Fri, 01 Nov 2019 10:49:04 -0400
Message-ID: <786313584.jd3umIO2dN@x2>
Organization: Red Hat
In-Reply-To: <f54be09d-297b-108a-533e-324a04fd1f6d@magitekltd.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<3063279.ZKBa9cPvsK@x2>
	<f54be09d-297b-108a-533e-324a04fd1f6d@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
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
X-MC-Unique: PfCX3WVXOHaaxRkawDa9jQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Friday, November 1, 2019 10:26:41 AM EDT Lenny Bruzenak wrote:
> On 11/1/19 9:16 AM, Steve Grubb wrote:
> > This is the root of the problem. Journald should never turn on audit
> > since it has no idea if auditd even has rules to load. What if the end
> > user does not want auditing? By blindly enabling audit without knowing
> > if its wanted, it causes a system performance hit even with no rules
> > loaded. It would be best if journald leaves audit alone. If it wants to
> > listen on the multicast socket, so be it. It should just listen and not
> > try to alter the system.
>
> +1 for me, except I would also question why it would even listen, as to
> me it seems that implies storage.
>=20
> If that's true, I would want to be able to disable it as I do not want
> audit events stored elsewhere as well.

It is true. You get 2 copies, one in the journal and it also relays one to=
=20
rsyslog. This should fix it:

systemctl mask systemd-journald-audit.socket

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

