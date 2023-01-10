Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5A6643C0
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 15:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673362558;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n977tgnNW6sqGdEGAWF5N701zZGPs4KQDaeQR7b5gbw=;
	b=f47uAEU7GWdwzKQwqm5fDi97CiZ5zv9hZNxeNeZIE7G788nZpy073mfx06U4aujTGpeB7E
	4RAjXq4If3HmNWOFJvZErdL0fq/viarN2up6vGJcz1/0N45yni/yVKOoz90om9QqSVyyFv
	jkd7EjHgu4WA4fJgwYxkFgElIwut+XY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-HfU0avvyPGe342pNltvyxg-1; Tue, 10 Jan 2023 09:55:55 -0500
X-MC-Unique: HfU0avvyPGe342pNltvyxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 476DF857F82;
	Tue, 10 Jan 2023 14:55:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F891492C14;
	Tue, 10 Jan 2023 14:55:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 999F7194E11A;
	Tue, 10 Jan 2023 14:55:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 882391946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 14:55:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B4C204014CE2; Tue, 10 Jan 2023 14:55:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC61940C945A
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 14:55:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BFB8196F5AD
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 14:55:28 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
 (sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-655-J9-QwIg8Mhql6D5JDBsXlw-1; Tue,
 10 Jan 2023 09:55:26 -0500
X-MC-Unique: J9-QwIg8Mhql6D5JDBsXlw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673362526; bh=xWaeD7ktjcku78j+Q1JBuLjGPOnw0USUJD0Wau4T6Rq=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=TxfHSEy52OiVU62hESFmhuX9FPUqcXEqBcEqt4q+FT1eO1WIxyuMt8ReayZTgnq+guUQfF0BO1iUzwL9sFvVY/Hrpt3STsEEn1OcxjIuEC/po3f0LExdFyDm3GROzbVVb0PyU2yVgwFVk842PLaJSH5U6w3mIvEHcP9n3ZTAmsIDfXi5Om+KTHo+I5jLRjxLH0hymTJKFjbTOJ36Tq0RzMP5bQkA4fhAnJtIarEK/FCp9CpNRfZ7WJJwxjowin8Sr2A5JcXgwGm+QJ7TVKIOZNeopc5FD6ixr5dDnKYDeQMGJnIY5FM8DT/VelfcdQ98fDCW1wCWdROWYdm0RRXPXA==
X-YMail-OSG: S6mhCy0VM1n46yWfp1OSkH9ac.HY1rnk8Q06OyqTPBZcx_PDalw1apTQgdwm6jF
 LeKbbpTerVGFVB9zXLzWTnDoaPSEQwS141iIbpRIRDhNZVHF.lBb2wPmjA1DdYD5BGlsthawDNN6
 XFpw6J22L6TK2Q4JaTvBuS2VfxQ1xjAb5rnplhBR7nkzQimL1bE_MQSJgHJiaW3GbRynxyI2B3y6
 nNPLlCz0HV5GcIpReuCb5vYFjZpSrLTQtL4Wh.gRdsXWTJw0_9.bcvGQiXzvNyVSfR4tKlJLY.8g
 OPaJVt7Ihgi7JaDh_lyS4CNZ6P7W8MOvH9CehqXTwSJT3xuHuEIn74K3tPHYoSYvhqUkuX5Mi_h0
 SUdDkAqa3.FQk9G6q6nC0H1FFbwqEn_oiwOMB5igsCw6ra6GlBWdtPn.NLan7gVqrVrS1CLjY_SV
 SWhgoC6m4e8Wzuz.etM8lYDja_wbmjiWv3E2FGj3NPZ0bR7.wM2Tnqby0tCJ21KtW5TLrcnjDEWk
 842r_HV_55bK7_yYoPJGLlsshDJ_s4YsFPpvXZonSmCCQQFV7sZfJ65jpROz3lmYjIjTjxGtKEkJ
 sYx1S8Dbe5T6Sc3vnGW2KOtVR5tjo9NiFoHn7SbDL86vEqPn4jLPSY8DUxzKN99CTPtgbTE3uJvL
 bdFZLe_WPlb.gexPhXkUgQEXgHtCGMFWwnccqPPDXHjYHE3wmcMJT2Ks.N8qeAu56CS4.QhMzJ.P
 p_TyKC.N.qvvBjoTI0inhcwCk5hysT0CETXCy_.CD_DDRJO3gg9m_q.obO2qWiKWsOi0eywvxDqC
 Uw.zR0FmJhtyA6TDPBiIEzIrVYGb9DQxeKqw_Ozbxqp.q.nSfnWcbF8jewUTs1GGWpdA8m7rVn3R
 XOAjGTtvq0IOJUNO7T8yCVZ8kSU7f7AfnTBZL1nPnRXm5j4AaTUtxuPWD1cB_IsqiG4R_t4Bnkg8
 9paP5s5XBAo8W7c_wRUA6W2r4L_MYjIDsKlWpFsGd0Uz7KLEp_8CH5UA_kn5FVcST1gu6_HWFv6k
 g9HAkIcQL.MA53kqyfcEn5Kpur4INUyoVZXwKKSYnEDCjFnCwlNfjF7rRqfs1p8yG0oXiKx28LLu
 UrOeIXHRYetfru_kE3loMWU7WRJz7mlXCrB3Tcb4noobv36lhPGJeJbgmuSPnUNjSNLTOs4BoNN8
 PiQOlM2fbu1NQB6aC.JLX8KpF0buQiMFmhuCmPKlkbDEqrIey9N5pGie5_QxwNdTiCWRmsKy9_gq
 soa2mC7WWZtH8aA4fxRf36WTeQrTvG39krk9bpxziVMS5phBGoZ5K8lwWJL4AgsZ9MRGrxfrPICK
 j2zvZ0O7qI3269K9w9aLwVtiEeMo6vh6wZ4csMDOudBH_ZCESE7mcwWdet9ilOANr7NK7q3tAfz4
 JmhXUbhXXA7ZOifMu0SJADLS6r4KH5OSO58i5RV4srrDC30O0J3Bi4e1_1UX35kuVG9AJIn.8uaz
 qLFbSqd2IF.IEeV2CFi.TZT9oyic0BaqasyXHo59Yu4UKLS7Tah66zQAc92WdOYMcIpLlke7OXP3
 1ZygC3Z2pl6YkzzVI7TQvxKoZ.WLV7R6HEqZvaxoR4vVl5cfM76ZzPc1CSMm7K4X1wZaMlFm17W5
 Efa5YtJmaWUTz6vgzGgoeRaUBR3VNc9xFQwTykRBCEhsh5IheBAJ7HYpuT4r7JQR0cMxTKcQVxB6
 zzpbwFKijFAK_rCX9aVk86otaFgMRX9cCaxqvETtXY5C2q9.h.p.x1PfFuOAdKutiFUzy3txYCzX
 viRDnTEScxJtfF1hXOuiUnAt4ePwZnA_ygkIDwXwGufR7Ayaep79HPxg_1aOMrAdOFMw8YzMJGd7
 G6Pk4MO0RFTTlJFJxvO4GXACwdlNFGrjxensrkKbbFqK_wTN.yXqrrYW_._FqEMYEV28dpO6eQEB
 BeNF6Xk3mOCylN9mZ9ZhAJFt0Ft5h2QWU4aKybjoipkFtW9wlConbKMUcA1S0cF6ajMjlnGxFVLS
 34eVoc9hxbtD_RLu_hUpeVJxZTaeQAoB0M.zH4EKHXgYvjQoaFwVGqB.aYCaRm8x8P7fAqDC869m
 Ob1Mbzo_qUna_DIZaAxhZ0cFbt2aargJMXvrJJqWhH9XQ1JkxSNkAJY8H4XmZLPwytoFhzvQewkQ
 6P77Thw1IZ9mYJqvIP9yQu_mmXYDW_n.IbZbmiAgk_zdiNFTV1wAqV3x1vBGOQTEBzrXKWYOrGyT
 ZmWJwW_KTFgafxtAaEBT7CiteRKXYo7yFWQPkj_X9Hys4aG38bgGABEgRdI8BS8gd0E.jv9iu.II
 nN1l_90WDDwAiVjWk4w--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 10 Jan 2023 14:55:26 +0000
Received: by hermes--production-ne1-7b69748c4d-xhmc5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c2eaf6e66469815b4ea3a0c4887793d3; 
 Tue, 10 Jan 2023 14:55:22 +0000 (UTC)
Message-ID: <ee775da5-dce5-6337-277d-8d384383ae16@schaufler-ca.com>
Date: Tue, 10 Jan 2023 06:55:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Identify whether the kernel version supports Path based exclusion
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>, Linux-audit@redhat.com
References: <CAPoNrttQd+ieQ+B93SbrbiPjppRoiyT_a+7FpiRdQNGQ2ApiXQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAPoNrttQd+ieQ+B93SbrbiPjppRoiyT_a+7FpiRdQNGQ2ApiXQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: avtanshgupta1995@gmail.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8xMC8yMDIzIDQ6MDggQU0sIEFudXJhZyBBZ2dhcndhbCB3cm90ZToKPiBIZWxsbyBBbGws
Cj4KPiBJIG5lZWQgYSBtZXRob2QgdG8gaWRlbnRpZnkgd2hldGhlciB0aGUgYXVkaWQgdmVyc2lv
biBhIGtlcm5lbCBpcwo+IHJ1bm5pbmcgc3VwcG9ydHMgcGF0aCBiYXNlZCBleGNsdXNpb25zLgoK
JSBjYXQgL3N5cy9rZXJuZWwvc2VjdXJpdHkvbHNtCgpUaGlzIHdpbGwgdGVsbCB5b3Ugd2hhdCBz
ZWN1cml0eSBtb2R1bGVzIGFyZSBpbiB1c2UuIENoZWNrIHdoZXRoZXIKYW55IG9mIHRoZSBtb2R1
bGVzIHRoYXQgdXNlIHBhdGggYmFzZWQgY29udHJvbHMgKEFwcEFybW9yLCBUT01PWU8pCmFyZSBp
biB0aGUgbGlzdC4KCj4KPiBPbmUgb3B0aW9uIHdvdWxkIGJlIHRvIHVzZcKgYXVkaXRfYWRkX3J1
bGVfZGF0YSB0byBhZGQgYSB0ZW1wb3JhcnkgcGF0aAo+IGJhc2VkIHJ1bGUgYW5kIGNoZWNrIGlm
IGl0IGlzIHN1Y2Nlc3NmdWwsIGJ1dCB0aGlzIHdvbid0IHdvcmsgd2hlbgo+IGF1ZGl0ZCBpcyBy
dW5uaW5nIGluIGltbXV0YWJsZSBtb2RlLgo+Cj4KPiBBbnkgb3RoZXIgd2F5IHdoaWNoIGRvZXMg
bm90IHJlcXVpcmUgY2hlY2tpbmcgdmVyc2lvbnMgb2YgS2VybmVsIG9yCj4gRGlzdHJpYnV0aW9u
Pwo+Cj4gLS0gCj4gQW51cmFnIEFnZ2Fyd2FsCj4KPiAtLQo+IExpbnV4LWF1ZGl0IG1haWxpbmcg
bGlzdAo+IExpbnV4LWF1ZGl0QHJlZGhhdC5jb20KPiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxp
c3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

