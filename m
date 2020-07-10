Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8F38221BE22
	for <lists+linux-audit@lfdr.de>; Fri, 10 Jul 2020 21:58:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-8-ZV2V_pOACO9aDCYuchqQ-1; Fri, 10 Jul 2020 15:58:19 -0400
X-MC-Unique: 8-ZV2V_pOACO9aDCYuchqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8178027E3;
	Fri, 10 Jul 2020 19:58:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A48FB74F5D;
	Fri, 10 Jul 2020 19:58:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B6021809547;
	Fri, 10 Jul 2020 19:57:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06AJp9A1010120 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 15:51:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1276010D14E0; Fri, 10 Jul 2020 19:51:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DAB210D14D3
	for <linux-audit@redhat.com>; Fri, 10 Jul 2020 19:51:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDA9D8007B1
	for <linux-audit@redhat.com>; Fri, 10 Jul 2020 19:51:05 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-349-YObrWsBfPIu4Sx7rtpLxTQ-1;
	Fri, 10 Jul 2020 15:51:03 -0400
X-MC-Unique: YObrWsBfPIu4Sx7rtpLxTQ-1
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net
	[162.237.133.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1865420B4908;
	Fri, 10 Jul 2020 12:42:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1865420B4908
Date: Fri, 10 Jul 2020 14:42:34 -0500
From: Tyler Hicks <tyhicks@linux.microsoft.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH] ima: Rename internal audit rule functions
Message-ID: <20200710194234.GA7254@sequoia>
References: <20200629153037.337349-1-tyhicks@linux.microsoft.com>
	<1593466203.5085.62.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1593466203.5085.62.camel@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06AJp9A1010120
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 10 Jul 2020 15:55:51 -0400
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org, "Serge E . Hallyn" <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2020-06-29 17:30:03, Mimi Zohar wrote:
> [Cc'ing the audit mailing list]
>=20
> On Mon, 2020-06-29 at 10:30 -0500, Tyler Hicks wrote:
> >=20
> > diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.=
h
> > index ff2bf57ff0c7..5d62ee8319f4 100644
> > --- a/security/integrity/ima/ima.h
> > +++ b/security/integrity/ima/ima.h
> > @@ -419,24 +419,24 @@ static inline void ima_free_modsig(struct modsig =
*modsig)
> >  /* LSM based policy rules require audit */
> >  #ifdef CONFIG_IMA_LSM_RULES
> > =20
> > -#define security_filter_rule_init security_audit_rule_init
> > -#define security_filter_rule_free security_audit_rule_free
> > -#define security_filter_rule_match security_audit_rule_match
> > +#define ima_audit_rule_init security_audit_rule_init
> > +#define ima_audit_rule_free security_audit_rule_free
> > +#define ima_audit_rule_match security_audit_rule_match
>=20
> Instead of defining an entirely new method of identifying files, IMA
> piggybacks on top of the existing audit rule syntax. =A0IMA policy rules
> "filter" based on this information.
>=20
> IMA already audits security/integrity related events. =A0Using the word
> "audit" here will make things even more confusing than they currently
> are. =A0Renaming these functions as ima_audit_rule_XXX provides no
> benefit. =A0At that point, IMA might as well call the
> security_audit_rule prefixed function names directly. =A0As a quick fix,
> rename them as "ima_filter_rule".
>=20
> The correct solution would probably be to rename these prefixed
> "security_audit_rule" functions as "security_filter_rule", so that
> both the audit subsystem and IMA could use them.

There doesn't seem to be any interest, from the audit side, in re-using
these. I don't quite understand why they would want to use them since
they're just simple wrappers around the security_audit_rule_*()
functions.

I'll go the "quick fix" route of renaming them as ima_filter_rule_*().

Tyler

>=20
> Mimi


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

