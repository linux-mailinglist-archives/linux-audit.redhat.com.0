Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8212E978E
	for <lists+linux-audit@lfdr.de>; Mon,  4 Jan 2021 15:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609771593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CYRxM+u9y5T7SqvuVduuhmXrOr8raul9boSFKiK3zWA=;
	b=fXP5Q1m7TsPQ5dUlwJekY4eGPe0TZbnmgz66RBrNDLE0zVD+XILxJYLTBLi6ebCnlez5xV
	wgkbsWbKOBbnYPKSq63wz8NyXPIsFELDc0ejirJ0M9RSeO2yL/k/qoBVMEuaC3BJB/IJJf
	uplB/4B9ceog5U8/8ngRkkH1HLEYYEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-p5X1v--jOKihcA1bfc6CXA-1; Mon, 04 Jan 2021 09:46:31 -0500
X-MC-Unique: p5X1v--jOKihcA1bfc6CXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311AE18C8C02;
	Mon,  4 Jan 2021 14:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A87711001281;
	Mon,  4 Jan 2021 14:46:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A02F54E58E;
	Mon,  4 Jan 2021 14:46:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104EkAQX028590 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 09:46:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B71A76E71E; Mon,  4 Jan 2021 14:46:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-249.rdu2.redhat.com [10.10.116.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DEB01349A;
	Mon,  4 Jan 2021 14:46:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>, burn@swtf.dyndns.org
Subject: Re: Occasional delayed output of events
Date: Mon, 04 Jan 2021 09:46:03 -0500
Message-ID: <2756596.e9J7NaK4W3@x2>
Organization: Red Hat
In-Reply-To: <1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5426593.DvuYhMxLoT@x2>
	<1340951117184f479e4f5dc75766fba91ed2c085.camel@iinet.net.au>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 4, 2021 2:55:25 AM EST Burn Alting wrote:
> On Sun, 2021-01-03 at 10:41 -0500, Steve Grubb wrote:
> > On Friday, January 1, 2021 4:22:33 PM EST Burn Alting wrote:
> > > Sometimes, events recorded in /var/log/audit/audit.log appear some
> > > seconds past co- located events which results in
> > > auparse:au_check_events() marking  these events complete before they
> > > are. An example of this can be seen below with the offending event id
> > > 44609.
> > > 
> > > This has been plaguing me for a year or two and this morning was the
> > > first time I still had access to the raw audit.log files (I monitor a lot
> > > of event types and the log files roll over fairly quickly).
> > > The example below is from a fully patched Centos 7 but I have also seen
> > > this on a patched Fedora 32.
> > > 
> > > Has this been seen before? Do we need to re-evaluate how auparse
> > > 'completes' an event (ie 2 seconds is too quick).
> > 
> > I have never seen this. But on the way to disk, auditd only does light
> > processing of the event.  If the format is enriched, it looks things up
> > on a record by record basis. It does not collect events until they are
> > complete - it dumps it to disk as soon as it can tack on the extra
> > information.
> > 
> > So, the question would be, does this delay happen on the way to disk? Or
> > is this an artifact of post processing the logs with an auparse based
> > utility? Can this be observed repeatedly on the same raw logs? If so,
> > then maybe auparse does have some issue. But if this is a post
> > processing issue, then the wall clock doesn't matter because this event
> > should have collected up together.
> > 
> > I'd say this merits some investigation.
> 
> OK. I think this needs to be addressed on two fronts. There may be more.
> A.  Within post processing ... a 2 second timeout is not sufficient. I
> would suggest we modify auparse.c:au_check_events() to i) perform the
> event type checks first, then
>   ii) increase the timeout of 2 seconds to be a larger value based on
> empirical tests.

In the post processing, there are 2 use cases. The first is events that are on 
disk. In this usage, the 2 second timeout does not come into effect because 
the events are run through probably within nanoseconds or microseconds at the 
worst. The only time it would come into effect is if the terminating record 
is missing.

The other use case is realtime processing as an audispd plugin. In this use 
case the wall clock could matter because records could potentially get lost 
due to overflows or another plugin taking too long. This is the use case where 
the wall clock matters. And again, it matters when records get lost or 
delayed in transit. As long as everything is flowing, it should not factor 
into event processing.

> B. I will build a temporary auditd daemon to perform some empirical testing
> to see how long events can reside within the daemon. I may need some
> advice on this. I assume that the code that sets the timestamp is in
> src/auditd.c:send_audit_event().

This is only for audit daemon's internal events. For all "real" events, it's 
set in the kernel.

> If so, I will see if I can put orchestration debug code in to monitor an
> event's 'time in daemon' until this point. I will then report on this.
> 
> I believe given that AUDIT_PROCTITLE and AUDIT_EOE is fairly widespread,
> then the testing switch in A. will not be a big issue (time cost wise). It
> will also mean that if we over compensate the timeout that would cause
> additional memory cost in auparse() then this is mittigated.

I'd suggest breaking up the event completion tests so that an exact 
collection termination reason code could be associated to the event.

> With respect to 'There may be more' fronts. Are there other points in the
> 'audit ecosystem' that makes use of the '2 second timeout'.

Ausearch/report has its own special copy of the event collection logic. It 
should be nearly identical to what auparse does.

> I will start work on this, this coming weekend if the above makes sense.

One other thought, the current shipping code is audit-3.0, doing a diff 
between it and audit-2.8.5 for the auparse directory does show some 
differences in event collection/grouping/next_event. A lot of the differences 
are cosmetic to fix extra whitespace or indentation. But if you skip all that, 
there are some real changes that probably were because of bug reports. For 
example,


@@ -259,15 +260,6 @@ static event_list_t *au_get_ready_event(
        if (lowest && lowest->status == EBS_COMPLETE) {
                lowest->status = EBS_EMPTY;
                au->au_ready--;
-               // Try to consolidate the array so that we iterate
-               // over a smaller portion next time
-               if (lowest == &lol->array[lol->maxi]) {
-                       au_lolnode *ptr = lowest;
-                       while (ptr->status == EBS_EMPTY && lol->maxi > 0) {
-                               lol->maxi--;
-                               ptr = &lol->array[lol->maxi];
-                       }
-               }
                return lowest->l;
        }

and

@@ -1536,6 +1550,13 @@ static int au_auparse_next_event(auparse
                aup_list_create(l);
                aup_list_set_event(l, &e);
                aup_list_append(l, au->cur_buf, au->list_idx, au-
>line_number);
+               // Eat standalone EOE - main event was already marked 
complete
+               if (l->head->type == AUDIT_EOE) {
+                       au->cur_buf = NULL;
+                       aup_list_clear(l);
+                       free(l);
+                       continue;
+               }
                if (au_lol_append(au->au_lo, l) == NULL) {
                        free((char *)e.host);
 #ifdef LOL_EVENTS_DEBUG01

I don't know if those have an effect on what you are seeing. But that is the 
only substantial changes that I can see.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

