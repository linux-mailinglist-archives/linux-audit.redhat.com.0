Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE669F40
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 00:56:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07B5530820EA;
	Mon, 15 Jul 2019 22:56:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC0A1001B3A;
	Mon, 15 Jul 2019 22:56:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 132784EBC3;
	Mon, 15 Jul 2019 22:56:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FMu6JN003988 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 18:56:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E19F1001B35; Mon, 15 Jul 2019 22:56:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-145.phx2.redhat.com [10.3.117.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F4C71001B19;
	Mon, 15 Jul 2019 22:56:00 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Preferred subj= with multiple LSMs
Date: Mon, 15 Jul 2019 18:55:59 -0400
Message-ID: <1979804.kRvuSoDnao@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
	<CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 15 Jul 2019 22:56:24 +0000 (UTC)

On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler <casey@schaufler-ca.com> 
wrote:
> > On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> > > On 2019-07-13 11:08, Steve Grubb wrote:
> > >> Hello,
> > >> 
> > >> On Friday, July 12, 2019 12:33:55 PM EDT Casey Schaufler wrote:
> > >>> Which of these options would be preferred for audit records
> > >>> when there are multiple active security modules?
> > >> 
> > >> I'd like to start out with what is the underlying problem that results
> > >> in this? For example, we have pam. It has multiple modules each having
> > >> a vote. If a module votes no, then we need to know who voted no and
> > >> maybe why. We normally do not need to know who voted yes.
> > >> 
> > >> So, in a stacked situation, shouldn't each module make its own event,
> > >> if required, just like pam? And then log the attributes as it knows
> > >> them? Also, what model is being used? Does first module voting no end
> > >> access voting? Or does each module get a vote even if one has already
> > >> said no?
> > >> 
> > >> Also, we try to keep LSM subsystems separated by record type numbers.
> > >> So, apparmour and selinux events are entirely different record numbers
> > >> and formats. Combining everything into one record is going to be
> > >> problematic for reporting.
> > > 
> > > I was wrestling with the options below and was uncomfortable with all
> > > of them because none of them was guaranteed not to break existing
> > > parsers.
> > 
> > I too, am uncomfortable regarding record parsing.

The record parsing for this is good as long as we are smart about it. We have 
to be able to do searches on subject and object labels. By default, ausearch 
uses strstr() to find a fragment of a label. That would still work the same 
with multiple labels if done right.


> If you can find me someone who is happy and comfortable with the
> current state of the audit record and/or formatting I would love to
> see them :)
> 
> > > Steve's answer is the obvious one, ideally allocating a seperate range
> > > to each LSM with each message type having its own well defined format.
> > 
> > It doesn't address the issue of success records, or records
> > generated outside the security modules.
> 
> Yes, exactly.  The individual LSM will presumably will continue to
> generate their own audit records as they do today and I would imagine
> that the subject and object fields could remain as they do today for
> the LSM specific records.
> 
> The trick is the other records which are not LSM specific but still
> want to include subject and/or object information.  Unfortunately we
> are stuck with some tough limitations given the current audit record
> format and Steve's audit userspace tools; 

Not really. We just need to approach the problem thinking about how to make 
it work based on how things currently work. For example Casey had a list of 
possible formats. Like this one:

Option 3:
        lsms=selinux,apparmor subj=x:y:z:s:c subj=a

I'd suggest something almost like that. The first field could be a map to 
decipher the labels. Then we could have a comma separated list of labels.

lsms=selinux,apparmor subj=x:y:z:s:c,a

Since ausearch uses strstr(), this will still work. 

> I can toss out some suggestions but it would be nice to hear what Steve's
> tools would support with respect to LSM subject/object value formats. 
> Steve, are these values interpreted at all by your tools, or are the opaque
> values?

subject label attributes are treat as strings. There is no attempt to 
interpret portions of the strings to have any meaning. The main requirement 
is that they have to be searchable.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
