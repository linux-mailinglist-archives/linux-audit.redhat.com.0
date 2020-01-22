Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 23BF5145881
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 16:18:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579706316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z2WsNcU8qHy2Xd+GBUq5QSjUOiYcAGrDHMmNgHYR984=;
	b=GBsYlfMCEoCebAbG0LqO1ZKjaeXfiF/nBEPxvAieDrguHYtNYbXbhmdoZmxAUpfOguxY/S
	EEXwejD50a2gA01AAJHeJx5Y6FCmChj3bcdnrjFdKrleE3ZiZ1+j/9BuiOeJuGd3XEOCGh
	aTzSizqzSsJcjmI8lyTGphzXmq0+qF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-GDnmPEvGNVySvX09ot39KA-1; Wed, 22 Jan 2020 10:18:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19BBD107ACC5;
	Wed, 22 Jan 2020 15:18:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F4F10842A9;
	Wed, 22 Jan 2020 15:18:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 232C418089C8;
	Wed, 22 Jan 2020 15:18:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MFIDqV010016 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 10:18:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74B6086C54; Wed, 22 Jan 2020 15:18:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FB68BE19;
	Wed, 22 Jan 2020 15:18:07 +0000 (UTC)
Date: Wed, 22 Jan 2020 10:18:04 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Burn Alting <burn@swtf.dyndns.org>
Subject: Re: auditing removable media
Message-ID: <20200122151804.syls3qmqsqinxsq6@madcap2.tricolour.ca>
References: <20200121201654.wezzozvsgbf57oz5@madcap2.tricolour.ca>
	<c4078163465539257084371f1b4eed0d105564bb.camel@swtf.dyndns.org>
	<80ba1854f20289af72a23a5c7cc0971a1a0b513e.camel@swtf.dyndns.org>
MIME-Version: 1.0
In-Reply-To: <80ba1854f20289af72a23a5c7cc0971a1a0b513e.camel@swtf.dyndns.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-MC-Unique: GDnmPEvGNVySvX09ot39KA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-23 00:43, Burn Alting wrote:
> Well, there is one thing we may need to change.
> If USBGuard is configured to sent it's logs to auditd generating a USER_DEVICE event
> type, we are going to have to add some new keys to the typetab.h table so that one
> can interpret some of the USBGuard keys. Unfortunately, USBGuard appears to decide
> to encode a key's value dependant on it's content (e.g. embedded spaces or quotes)
> not the key. I am not sure if ausearch's interpret code can decide on the fly
> whether to unescape a possible encoded key's value or that will need to be built in.
> Also any down-stream processing of interpreted values may be challenging given an
> example key value pair
> likeencoded:device_rule=616C6C6F7720696420316436623A303030322073657269616C202230303
> 0303A30303A31612E3022206E616D6520224548434920486F737420436F6E74726F6C6C6572222068617
> 3682022656A3157566564794C79554D4C6951787A45637277625934357A436F64775638354B7A7937686
> D324776343D2220706172656E742D686173682022652F5257306D4D624D2B54534651787052694D45664
> C372F33524A664B5664716666426D39463571412B453D22207669612D706F72742022757362312220776
> 974682D696E746572666163652030393A30303A3030decoded:device_rule=allow id 1d6b:0002
> serial "0000:00:1a.0" name "EHCI Host Controller" hash
> "ej1WVedyLyUMLiQxzEcrwbY45zCodwV85Kzy7hm2Gv4=" parent-hash
> "e/RW0mMbM+TSFQxpRiMEfL7/3RJfKVdqffBm9F5qA+E=" via-port "usb1" with-interface
> 09:00:00 

Yes, fields need to be consistently encoded since the parser isn't able
to detect that.

> On Wed, 2020-01-22 at 20:27 +1100, Burn Alting wrote:
> > Richard,
> > 
> > On the surface, it appears to have value, but as you say it would need to be
> > extended to other traditional, and non-traditional, removable media. Further, the
> > initial appeal in having the capability directly within the kernel was to make it
> > a little more difficult to subvert, centralise auditing policy/monitoring and, if
> > frame-worked appropriately, easily extensible to other than USB media types (which
> > was the basis for the Proof of Concept developed by RedHat back in 2016).
> > 
> > I have not used USBGuard myself, so will do some experimentation and report back.
> > 
> > Regards
> > 
> > On Tue, 2020-01-21 at 15:16 -0500, Richard Guy Briggs wrote:
> > > Hi Burn, and all,
> > > I've been aware of this issue for a while now, but wasn't directlyworking on
> > > it.  Now that I'm taking a closer look at this issue, I amwondering how much
> > > USBGuard changes the equation?
> > > https://www.kernel.org/doc/Documentation/usb/authorization.txt
> > > https://usbguard.github.io/
> > > 	https://github.com/USBGuard/usbguard
> > > 
> > > https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard
> > > 
> > > It has tools to generate baseline lists of devices, but this is only
> > > forusb.  Other interfaces would need to be appropriately instrumented.
> > > - RGB

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

