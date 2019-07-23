Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82C721CE
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 23:47:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7748530C75A2;
	Tue, 23 Jul 2019 21:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B24855D9C5;
	Tue, 23 Jul 2019 21:47:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FE6941F53;
	Tue, 23 Jul 2019 21:47:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6NLl9Ns016202 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jul 2019 17:47:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6A47601B6; Tue, 23 Jul 2019 21:47:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80E3C60BCE;
	Tue, 23 Jul 2019 21:47:03 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2EFA308C385;
	Tue, 23 Jul 2019 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id x6NLkwlk017263;
	Tue, 23 Jul 2019 21:46:58 GMT
Date: Wed, 24 Jul 2019 07:46:58 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Simon McVittie <smcv@collabora.com>
Subject: Re: Preferred subj= with multiple LSMs
In-Reply-To: <20190723140634.GA30188@horizon>
Message-ID: <alpine.LRH.2.21.1907240746280.16974@namei.org>
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
	<20190723140634.GA30188@horizon>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Delayed for 24:56:24 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Tue, 23 Jul 2019 21:47:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 23 Jul 2019 21:47:02 +0000 (UTC) for IP:'65.99.196.166'
	DOMAIN:'namei.org' HELO:'namei.org' FROM:'jmorris@namei.org'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 65.99.196.166 namei.org 65.99.196.166 namei.org
	<jmorris@namei.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 21:47:30 +0000 (UTC)

On Tue, 23 Jul 2019, Simon McVittie wrote:

> On Mon, 22 Jul 2019 at 18:30:35 -0400, Paul Moore wrote:
> > On Mon, Jul 22, 2019 at 6:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > > I suggest that if supporting dbus well is assisted by
> > > making reasonable restrictions on what constitutes a valid LSM
> > > "context" that we have a good reason.
> > 
> > I continue to believe that restrictions on the label format are a bad
> > idea
> 
> Does this include the restriction "the label does not include \0",
> which is an assumption that dbus is already relying on since I checked
> it in the thread around
> <https://marc.info/?l=linux-security-module&m=142323508321029&w=2>?
> Or is that restriction so fundamental that it's considered OK?

Security labels are strings, so this is implied.


-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
