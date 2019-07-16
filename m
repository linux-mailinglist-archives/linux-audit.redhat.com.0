Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DB6ACE5
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 18:37:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14ACF3082E8E;
	Tue, 16 Jul 2019 16:37:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E04A919C68;
	Tue, 16 Jul 2019 16:37:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 695414EA31;
	Tue, 16 Jul 2019 16:37:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GGbfDt002055 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 12:37:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57AD7608A6; Tue, 16 Jul 2019 16:37:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-76.phx2.redhat.com [10.3.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5C9860A9F;
	Tue, 16 Jul 2019 16:37:38 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Preferred subj= with multiple LSMs
Date: Tue, 16 Jul 2019 12:37:38 -0400
Message-ID: <9150011.WShEb2oc6S@x2>
Organization: Red Hat
In-Reply-To: <201113d1-192f-d6b3-17bb-bcf219bc5f15@magitekltd.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<3577098.oGDFHdoSSQ@x2>
	<201113d1-192f-d6b3-17bb-bcf219bc5f15@magitekltd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 16 Jul 2019 16:37:52 +0000 (UTC)

On Tuesday, July 16, 2019 12:33:30 PM EDT Lenny Bruzenak wrote:
> On 7/16/19 11:14 AM, Steve Grubb wrote:
> > Quoting has a specific meaning in audit fields. So, we really shouldn't
> > do
> > that. We can simply pick another field delimiter. I really don't care
> > which it is as long as its illegal for use in a label. For example, we
> > use
> > 
> > #define AUDIT_KEY_SEPARATOR 0x01
> > 
> > to separate key fields. We can pick almost anything. (exclamation mark,
> > semi- colon, hash, plus symbol, tilde, 0x02, whatever) But it will need
> > to be documented and put into the API so that everyone is aware of the
> > convention.
> > 
> > -Steve
> 
> Also should it not be the "#define AUDIT_INTERP_SEPARATOR 0x1D" for
> enriched format records?

True. That one is disqualified, too.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
