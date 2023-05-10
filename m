Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BE6FDEEE
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 15:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683726205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZOG2CJK55VXfhmeK+ujaRPSsCaRhvWx2Eq4OJt7CEfw=;
	b=Jxq6g0/qZXW3mW6kOWl1Jqn0SP5/edNYf+2QEqPimpzb5YUnmmF20YniHI4znSCfKYAToK
	gmHNMS8Bqdo9xNzGs4POTUMV9hExu6yL2NLDg3vDv4QEMYzhj6wtnQB8KVm4YOsqtgUIkp
	27avjwnJDmbEwfL2azV30qo2/yWF130=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-CKDaSUhdPaG948PRjxVknw-1; Wed, 10 May 2023 09:43:23 -0400
X-MC-Unique: CKDaSUhdPaG948PRjxVknw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69F8857FB5;
	Wed, 10 May 2023 13:43:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBC1640102F;
	Wed, 10 May 2023 13:43:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 495B319451C3;
	Wed, 10 May 2023 13:43:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 19EFC1946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 13:43:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A9C72166B29; Wed, 10 May 2023 13:43:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0262D2166B26
 for <linux-audit@redhat.com>; Wed, 10 May 2023 13:43:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D972A100F650
 for <linux-audit@redhat.com>; Wed, 10 May 2023 13:43:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-HvwHCFfePU25hOXQ5YO7Aw-2; Wed, 10 May 2023 09:43:16 -0400
X-MC-Unique: HvwHCFfePU25hOXQ5YO7Aw-2
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-96622bca286so916937166b.1
 for <linux-audit@redhat.com>; Wed, 10 May 2023 06:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726195; x=1686318195;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWRRm5F8q4sBAb/N4Mg2lIu36YRTjl8baoNWKIbrGKw=;
 b=d9yt3TMXoFFdfUT891tXqoiEEm9ASTO2Tegs4FdJGQt9+ZvhwBGb7OEtMmMEgHo+j3
 c9lp9Oz+noIdyP0Vv0Cirbhkvhs+rPns/d+CtIOaVsqQ9CFFVlihbZkoT0gRfobLOdze
 5JzrWFN0aLqRVpzhJf2cM+xzKy2ysDougpyp5KxujaCYZK1riGuwolLjNtwLYKENhoVz
 p1YwaQQaggez6pi6p4XBohhKpwpvafs3dnWa1rRH9p6WugaYaaUXlJLXzklNEl/mp+7q
 5iiqCJedti9bdoHVrHRsi+xVCMMPBeANCbE0p8WhENbNZpkMp7pUN9tk2zrYJE22PPiY
 GHAg==
X-Gm-Message-State: AC+VfDziwEHAZkVoL9KlWOFx5+wy58ue7NLLzUg3YCFpyVVeBdmXKbnP
 kc+QsTYRq4i/l01djDpjHYdJSc5EapI7yXWcplVGrd7jby4TjxFR17o=
X-Google-Smtp-Source: ACHHUZ77pjkaC+i/JUMgYGuL4fu4UpU4iMuqJtYfTWCDemAsqm5FprI/iQTIzo/cyG2iKV6dzCCdwv1OTqGjzaGQuKA=
X-Received: by 2002:a17:907:1c03:b0:94e:4489:f24d with SMTP id
 nc3-20020a1709071c0300b0094e4489f24dmr16205322ejc.61.1683726194997; Wed, 10
 May 2023 06:43:14 -0700 (PDT)
MIME-Version: 1.0
From: kathy lyons <kathy.lyons@zayo.com>
Date: Wed, 10 May 2023 09:43:04 -0400
Message-ID: <CAN-5jM-V+J5aZTnu86NzgKw3LGSZ76LyTusrF-MF+V_LjV3u7A@mail.gmail.com>
Subject: sending audit logs only to audit.log via rsyslog
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zayo.com
Content-Type: multipart/mixed; boundary="===============0713816315270176290=="

--===============0713816315270176290==
Content-Type: multipart/alternative; boundary="000000000000c0983c05fb570def"

--000000000000c0983c05fb570def
Content-Type: text/plain; charset="UTF-8"

 Good morning.  I am trying to get the audit logs to be written only to
audit.log.  Currently they are written to audit.log as well as syslog.
Here is my rsyslog.conf file - what am I doing wrong?

    module(load="imfile")
    module(load="imklog")
    module(load="imjournal")

    global(net.enableDNS="off" workDirectory=/var/spool/rsyslog"
maxMessageSize="128k")

   $IncludeConfig /etc/rsyslog.d/*.conf
   $ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

  ##################### rules
    audit.*                                 ~/var/log/audit/audit.log
    auth.warning;authpriv.info   ~/var/log/auth.log
    *.*;auth,authpriv.none           ~/var/log/syslog
    cron.info                               ~/var/log/cron.log
    daemon.info                        ~/var/log/daemon.log
    kern.*                                  ~/var/log/kern.log
    user.info                             ~/var/log/user.log

--000000000000c0983c05fb570def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+DQo8ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+
PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+R29vZCBtb3JuaW5nLsKgIEkgYW0gdHJ5aW5n
IHRvIGdldCB0aGUgYXVkaXQgbG9ncyB0byBiZSB3cml0dGVuIG9ubHkgdG8gYXVkaXQubG9nLsKg
IEN1cnJlbnRseSB0aGV5IGFyZSB3cml0dGVuIHRvIGF1ZGl0LmxvZyBhcyB3ZWxsIGFzIHN5c2xv
Zy7CoCBIZXJlIGlzIG15IHJzeXNsb2cuY29uZiBmaWxlIC0gd2hhdCBhbSBJIGRvaW5nIHdyb25n
Pzxicj48YnI+PC9kaXY+wqDCoMKgIG1vZHVsZShsb2FkPSZxdW90O2ltZmlsZSZxdW90Oyk8YnI+
PC9kaXY+wqDCoMKgIG1vZHVsZShsb2FkPSZxdW90O2lta2xvZyZxdW90Oyk8YnI+PC9kaXY+wqDC
oMKgIG1vZHVsZShsb2FkPSZxdW90O2ltam91cm5hbCZxdW90Oyk8YnI+PGJyPjwvZGl2PsKgwqDC
oCBnbG9iYWwobmV0LmVuYWJsZUROUz0mcXVvdDtvZmYmcXVvdDsgd29ya0RpcmVjdG9yeT0vdmFy
L3Nwb29sL3JzeXNsb2cmcXVvdDsgbWF4TWVzc2FnZVNpemU9JnF1b3Q7MTI4ayZxdW90Oyk8YnI+
wqAgPGJyPjwvZGl2PsKgwqAgJEluY2x1ZGVDb25maWcgL2V0Yy9yc3lzbG9nLmQvKi5jb25mPGJy
PjwvZGl2PsKgwqAgJEFjdGlvbkZpbGVEZWZhdWx0VGVtcGxhdGUgUlNZU0xPR19UcmFkaXRpb25h
bEZpbGVGb3JtYXQ8YnI+PGJyPjwvZGl2PsKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyBydWxlczxi
cj48L2Rpdj7CoMKgwqAgYXVkaXQuKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfi92YXIvbG9nL2F1ZGl0L2F1ZGl0LmxvZzxi
cj48L2Rpdj7CoCDCoCBhdXRoLndhcm5pbmc7PGEgaHJlZj0iaHR0cDovL2F1dGhwcml2LmluZm8i
PmF1dGhwcml2LmluZm88L2E+wqDCoCB+L3Zhci9sb2cvYXV0aC5sb2c8YnI+PC9kaXY+wqDCoMKg
ICouKjthdXRoLGF1dGhwcml2Lm5vbmXCoMKgwqDCoMKgwqDCoMKgwqDCoCB+L3Zhci9sb2cvc3lz
bG9nPGJyPjwvZGl2PsKgwqDCoCA8YSBocmVmPSJodHRwOi8vY3Jvbi5pbmZvIj5jcm9uLmluZm88
L2E+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH4vdmFyL2xvZy9jcm9uLmxvZzxicj48L2Rpdj7CoMKgwqAgPGEgaHJlZj0iaHR0cDov
L2RhZW1vbi5pbmZvIj5kYWVtb24uaW5mbzwvYT7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH4vdmFyL2xvZy9kYWVtb24ubG9nPGJyPjwvZGl2PsKgwqDCoCBr
ZXJuLirCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfi92YXIvbG9nL2tlcm4ubG9nPGJyPjwvZGl2PsKgwqDCoCA8YSBocmVm
PSJodHRwOi8vdXNlci5pbmZvIj51c2VyLmluZm88L2E+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfi92YXIvbG9nL3VzZXIubG9nDQoNCjwv
ZGl2Pg0K
--000000000000c0983c05fb570def--

--===============0713816315270176290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0713816315270176290==--

