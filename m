Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D11D1FB71C
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 17:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592322235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bNmlHu8eU0DhYVRNL/AVz/Cq3/2tLQZUuQLYPp4D4LM=;
	b=OTDE9Og8RFatnNGW8GqlDCdXmEsUzwp41LCTZ/1P19kGTgEjwHcL90xobpX7kAqYkOFe5d
	F3H5juLa34MVYo3AZ7Az1yIP/4OdLULpBL83oGWiJAARk/77MBvg516WRWNZruetdCdUzZ
	sidlmjNb+qVTlO3NQnJxrc5QSovcbWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-1kz5akD9O-uEqEM_X5-1SA-1; Tue, 16 Jun 2020 11:43:51 -0400
X-MC-Unique: 1kz5akD9O-uEqEM_X5-1SA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9D618FE86A;
	Tue, 16 Jun 2020 15:43:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF08B619C0;
	Tue, 16 Jun 2020 15:43:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05B30833C6;
	Tue, 16 Jun 2020 15:43:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GFhYXR030972 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 11:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C413910002BC; Tue, 16 Jun 2020 15:43:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-82.phx2.redhat.com [10.3.113.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 777BE1001B07;
	Tue, 16 Jun 2020 15:43:28 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2 1/2] integrity: Add result field in audit message
Date: Tue, 16 Jun 2020 11:43:26 -0400
Message-ID: <41911815.FMGa2a4QOz@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhTmShh8ggdjLKf_ciL6fDt3ZH59BXaXMAgd8LFzqVj6rQ@mail.gmail.com>
References: <20200613022633.3129-1-nramas@linux.microsoft.com>
	<CAHC9VhTmShh8ggdjLKf_ciL6fDt3ZH59BXaXMAgd8LFzqVj6rQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, June 15, 2020 6:51:22 PM EDT Paul Moore wrote:
> On Fri, Jun 12, 2020 at 10:26 PM Lakshmi Ramasubramanian
> 
> <nramas@linux.microsoft.com> wrote:
> > Result code is not included in the audit messages logged by
> > the integrity subsystem. Add "result" field in the audit messages
> > logged by the integrity subsystem and set the value to the result code
> > passed to integrity_audit_msg() in the "result" parameter.
> > 
> > Sample audit message:
> > 
> > [    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0
> > auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate
> > cause=alloc_entry comm="swapper/0" name="boot_aggregate" res=0
> > result=-12
> > 
> > [    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0
> > auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
> > op=policy_update cause=completed comm="systemd" res=1 result=0
> > 
> > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > ---
> > 
> >  security/integrity/integrity_audit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> If we can't use "res=" to carry more than 0/1 then this seems reasonable.

Paul,

But we can't do this. The field name dictionary says this is used to convey 
success/fail. It is hard coded in the field interpretation table to look for 
0/1 and interpret that. Interpeting this field will now produce an error 
message. And "result" is a searchable field.

As I suggested a few emails back, let's just use errno or something not 
already taken in the dictionary. NACK.

-Steve

> Acked-by: Paul Moore <paul@paul-moore.com>
> 
> > diff --git a/security/integrity/integrity_audit.c
> > b/security/integrity/integrity_audit.c index 5109173839cc..84002d3d5a95
> > 100644
> > --- a/security/integrity/integrity_audit.c
> > +++ b/security/integrity/integrity_audit.c
> > @@ -53,6 +53,6 @@ void integrity_audit_msg(int audit_msgno, struct inode
> > *inode,> 
> >                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
> >                 audit_log_format(ab, " ino=%lu", inode->i_ino);
> >         
> >         }
> > 
> > -       audit_log_format(ab, " res=%d", !result);
> > +       audit_log_format(ab, " res=%d result=%d", !result, result);
> > 
> >         audit_log_end(ab);
> >  
> >  }
> > 
> > --
> > 2.27.0




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

